import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobi_care/models/admin_model.dart';
import 'package:mobi_care/models/doctor_model.dart';
import 'package:mobi_care/shared/constants/constants.dart';
import 'package:mobi_care/shared/network/remote/dio_helper.dart';
import 'package:mobi_care/shared/network/remote/end_point.dart';
import '../../../../models/patient_model.dart';
import 'states.dart';


class LoginCubit extends Cubit<LoginStates>{

  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(BuildContext context) =>BlocProvider.of(context);

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility(){
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(LoginChangePasswordVisibility());
  }

  void addPatientFUID({required int id , required String fuid , required String token}){
    emit(AddPatientFUIDLoadingState());
    try{
      DioHelper.putData(
        url: Add_Patient_FUID,
        token: token,
        data: {
          'id' : id,
          'fuid' : fuid,
        },
      ).then((value) {
        print('ADDPATIENTFUID: #################################');
        print(value.data['message']);
        emit(AddPatientFUIDSuccessfullyState());
      });
    }catch(e){
      print(e.toString());
      emit(AddPatientFUIDErrorState());
    }
  }

  void addDoctorFUID({required int id , required String fuid , required String token}){
    emit(AddDoctorFUIDLoadingState());
    try{
      DioHelper.putData(
        url: Add_Doctor_FUID,
        token: token,
        data: {
          'id' : id,
          'fuid' : fuid,
        },
      ).then((value) {
        print('ADDDOCTORFUID: #################################');
        print(value.data);
        print(value.data['message']);
        emit(AddDoctorFUIDSuccessfullyState());
      });
    }catch(e){
      print(e.toString());
      emit(AddDoctorFUIDErrorState(e.toString()));
    }
  }


  Future<void> userLogin({
    required String email ,
    required String password
  }){
    emit(LoginLoadingState());
    try{
      print('${email} ${password}');
      return DioHelper.postData(
          url: LOGIN ,
          data:
          {
            'EMAIL' : email,
            'PASSWORD' : password,
          }
      ).then((value) {
        role = value.data['role'];
        print(value.data);
        print('##############################################');
        print('role $role');
        if(role.toString().compareTo('DOCTOR') == 0){
          asDoctorModel = DoctorModel.fromJson(value.data);
          print('**************************************************');
          print('MODEL:*********************************************');
          print(asDoctorModel);
          print(asDoctorModel!.data!.address.toString());
          print(asDoctorModel!.accessToken);
          print('asDoctorModel');
          print(asDoctorModel);
        }else{
          asPatientModel = PatientModel.fromJson(value.data);
          print('MODEL:################################################');
          print(asPatientModel);
          print(asPatientModel!.data!.address.toString());
          print(asPatientModel!.accessToken);
        }
        emit(UserLoginSuccessfullyState(token: value.data['accessToken']));
      });
    }catch(e){
      emit(UserLoginErrorState(error: e.toString()));
      return Future(() => print("error: $e"));
    }
  }


  Future<void> userLoginByFirebase({
    required String email ,
    required String password,
  }){
    emit(LoginLoadingFirebaseState());
    try{
      return FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      ).then((value) {
        print(value.user!.email);
        print(value.user!.uid);
        uId = value.user!.uid;
        emit(LoginSuccessFirebaseState(uId: value.user!.uid));
      });
    }catch(e){
      emit(LoginErrorFirebaseState(error: e.toString()));
      return Future(() => print(e.toString()));
    }
  }

  Future<void> loginPatientByFirebase({
    required String email ,
    required String password,
  }){
    emit(LoginPatientLoadingFirebaseState());
    try{
      return FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      ).then((value) {
        print(value.user!.email);
        print(value.user!.uid);
        uId = value.user!.uid;
        emit(LoginPatientSuccessFirebaseState(uId: value.user!.uid));
      });
    }catch(e){
      emit(LoginPatientErrorFirebaseState(error: e.toString()));
      return Future(() => print(e.toString()));
    }
  }

  Future<void> loginDoctorByFirebase({
    required String email ,
    required String password,
  }){
    emit(LoginDoctorLoadingFirebaseState());
    try{
      return FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      ).then((value) {
        print(value.user!.email);
        print(value.user!.uid);
        print(value.user);
        uId = value.user!.uid;
        emit(LoginDoctorSuccessFirebaseState(uId: value.user!.uid));
      });
    }catch(e){
      emit(LoginPatientErrorFirebaseState(error: e.toString()));
      return Future(() => print(e.toString()));
    }
  }

  void login({
    required String email ,
    required String password,
  }){
    userLogin(email: email, password: password).then((value) {
      if(role == 'DOCTOR'){
        try{
          loginDoctorByFirebase(email: email, password: password).then((value) {
            addDoctorFUID(id: asDoctorModel!.data!.iD!, fuid: uId.toString() , token: asDoctorModel!.accessToken!);
            emit(MainDoctorLoginSuccessState());
          });
        }catch(e){
          print(e.toString());
          emit(MainDoctorLoginErrorState(error: e.toString()));
        }
      }else if(role == 'PATIENT'){
        try{
          loginPatientByFirebase(email: email, password: password).then((value) {
            emit(MainPatientLoginSuccessState());
            addPatientFUID(id: asPatientModel!.data!.iD!, fuid: uId.toString() , token: asPatientModel!.accessToken!);
            emit(MainPatientLoginSuccessState());
          });
        }catch(e){
          emit(MainDoctorLoginErrorState(error: e.toString()));
          return Future(() => print(e.toString()));
        }
      }
    });
  }

  // Future<void> adminLogin({
  //   required String email,
  //   required String password,
  // }) async{
  //
  //   String url = 'http://127.0.0.1:4000$ADMIN_LOGIN';
  //   Map<String, dynamic> data = {
  //     'EMAIL': email,
  //     'PASSWORD':password,
  //   };
  //   var jsonData = jsonEncode(data);
  //
  //   try{
  //     emit(AdminLoginLoadingState());
  //     http.Response response = await http.post(
  //       Uri.parse(url),
  //       body: jsonData
  //     );
  //     // adminAccessToken = json.decode(response.body)['accessToken'];
  //     print(json.decode(response.body));
  //
  //     // AdminModel adminModel = AdminModel.fromJson(json.decode(response.body));
  //     // print(adminModel.message);
  //     emit(AdminLoginSuccessfullyState());
  //     if(response.statusCode == 200 ){
  //
  //     }
  //
  //   }catch(error){
  //     print('ERROR  ${error.toString()}');
  //   }
  // }

  AdminModel ? adminModel;

  void adminLogin({
    required String email ,
    required String password,
  }){
    emit(AdminLoginLoadingState());
    print('Email : $email , Password: $password');
    DioHelper.postData(
      url: ADMIN_LOGIN,
      data: {
        'EMAIL': email,
        'PASSWORD': password,
      },
    ).then((value) {
      print(value);
      adminModel = AdminModel.fromJson(value.data);
      print('Message : ${adminModel!.message}');
      print('Token: ${adminModel!.accessToken}');
    }).catchError((error){
      print(error.toString());
      emit(AdminLoginErrorState(error: error.toString()));
      print('ERROR : ${error.toString()}');
    });
  }
}