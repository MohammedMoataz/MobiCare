import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobi_care/shared/network/remote/end_point.dart';
import '../../../../shared/network/remote/dio_helper.dart';
import '/models/user_model.dart';
import 'states.dart';

class RegisterCubit extends Cubit<RegisterStates>{

  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(BuildContext context) => BlocProvider.of(context);

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;
  int ? gender;
  DateTime ? selectedDate;

  void changePasswordVisibility(){
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(RegisterChangePasswordVisibility());
  }

  void changeGenderValue(int value){
    gender = value;
    emit(ChangeGenderValueState());
  }

  void selectBirthDate(DateTime dateTime){
    selectedDate = dateTime;
    emit(SelectDateOfBirthState());
  }

  String tallValue = '49';

  List<DropdownMenuItem<String>> get tallItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(child: Text('49'), value: '49'),
      for (int i = 50; i < 250; i++)
        DropdownMenuItem(child: Text('${i++}'), value: '${i++}'),
    ];
    return menuItems;
  }

  void changeTallValue(String newValue) {
    tallValue = newValue;
    emit(ChangeTallState());
  }

  String weightValue = '19';

  List<DropdownMenuItem<String>> get weightItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(child: Text('19'), value: '19'),
      for (int j = 20; j < 500; j++)
        DropdownMenuItem(child: Text('${j++}'), value: '${j++}'),
    ];
    return menuItems;
  }

  void changeWeightValue(String newValue) {
    weightValue = newValue;
    emit(ChangeWeightState());
  }

  void createPatientUsingFirebase({
    required String email ,
    required String firstName,
    required String lastName,
    required String address,
    required String uId,
    required bool isMale,
}){
    UserModel userModel = UserModel(
      email: email,
      firstName: firstName,
      lastName: lastName,
      address: address,
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/727/727369.png?w=740&t=st=1682386759~exp=1682387359~hmac=c7ad8bed588c7760e0b5701f3de6468304217539c53f8a9c018e3f8bcbba0b33',
      uId: uId,
      isMale: isMale,
      role: 'P',
    );
    emit(CreatePatientLoadingFirebaseState());
    FirebaseFirestore.instance
        .collection('patients')
        .doc(uId)
        .set(userModel.toMap())
        .then((value) {
          emit(CreatePatientSuccessFirebaseState());
    }).catchError((error){
      emit(CreatePatientErrorFirebaseState());
      print(error.toString());
    });
  }

  Future<void> registerPatientByFirebase({
    required String email ,
    required String password,
    required String firstName,
    required String lastName,
    required String address,
    required bool isMale,
  }){
    emit(RegisterPatientLoadingFirebaseState());
    return FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password
    ).then((value) {
      print(value.user!.email);
      print(value.user!.uid);
      createPatientUsingFirebase(
        email: email,
        firstName: firstName,
        lastName: lastName,
        address: address,
        uId: value.user!.uid,
        isMale: isMale
      );
    }).catchError((error) {
      print(error.toString());
      emit(RegisterPatientErrorFirebaseState());

    });
  }

  Future<void> registerPatient({
    required String patientFirstName,
    required String patientLastName,
    required String patientEmail,
    required String patientPassword,
    required String patientAddress,
    required DateTime dateOfBirth,
    required int patientGender,
    required String patientHeight,
    required String patientWeight,
  }){
    emit(RegisterLoadingState());
    return DioHelper.postData(
        url: REGISTRATION ,
        data:
        {
          'PATIENT_FIRST_NAME' : patientFirstName,
          'PATIENT_LAST_NAME': patientLastName,
          'PATIENT_EMAIL' : patientEmail,
          'PATIENT_PASSWORD' : patientPassword,
          'PATIENT_ADDRESS' : patientAddress,
          'DOB' : '${dateOfBirth.year}-${dateOfBirth.month}-${dateOfBirth.day}',
          'PATIENT_GENDER' : patientGender,
          'PATIENT_WEIGHT' : patientWeight,
          'PATIENT_HEIGHT' : patientHeight,
        }
    ).then((value) {
      print('***********************************************');
      print(value.data);
      emit(RegisterSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(RegisterErrorState(error: error.toString()));
    });
  }

  void register({
    required String patientFirstName,
    required String patientLastName,
    required String patientEmail,
    required String patientPassword,
    required String patientAddress,
    required DateTime dateOfBirth,
    required int patientGender,
    required String patientHeight,
    required String patientWeight,
  }){
    registerPatient(
        patientFirstName: patientFirstName,
        patientLastName: patientLastName,
        patientEmail: patientEmail,
        patientPassword: patientPassword,
        patientAddress: patientAddress,
        dateOfBirth: dateOfBirth,
        patientGender: patientGender,
        patientHeight: patientHeight,
        patientWeight: patientWeight
    ).then((value) {
      print('#################################################');
      registerPatientByFirebase(
          email: patientEmail,
          password: patientPassword,
          firstName: patientFirstName,
          lastName: patientLastName,
          address: patientAddress,
        isMale: gender == 0 ? false : true,
      ).then((value) {
        emit(RegisterationSuccessfullyState());
      }).catchError((error){
        print(error.toString());
        emit(RegisterationErrorState(error: error.toString()));
      });
    });
  }

  void createDoctorUsingFirebase({
    required String email ,
    required String firstName,
    required String lastName,
    required String phone,
    required String address,
    required String uId,
  }){
    UserModel userModel = UserModel(
      email: email,
      firstName: firstName,
      lastName: lastName,
      address: address,
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/727/727369.png?w=740&t=st=1682386759~exp=1682387359~hmac=c7ad8bed588c7760e0b5701f3de6468304217539c53f8a9c018e3f8bcbba0b33',
      uId: uId,
      isMale: false,
      role: 'D',
    );
    emit(CreateDoctorLoadingFirebaseState());
    FirebaseFirestore.instance
        .collection('doctors')
        .doc(uId)
        .set(userModel.toMap())
        .then((value) {
      emit(CreateDoctorSuccessFirebaseState());
    }).catchError((error){
      emit(CreateDoctorErrorFirebaseState());
      print(error.toString());
    });
  }

  Future<void> registerDoctorByFirebase({
    required String email ,
    required String password,
    required String firstName,
    required String lastName,
    required String phone,
    required String address,
  }){
    emit(RegisterDoctorLoadingFirebaseState());
    return FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password
    ).then((value) {
      print(value.user!.email);
      print(value.user!.uid);
      createDoctorUsingFirebase(
        email: email,
        firstName: firstName,
        lastName: lastName,
        phone: phone,
        address: address,
        uId: value.user!.uid,
      );
    }).catchError((error) {
      print(error.toString());
      emit(RegisterDoctorErrorFirebaseState());
    });
  }
  
}