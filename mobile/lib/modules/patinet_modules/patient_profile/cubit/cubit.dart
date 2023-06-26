import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobi_care/models/get_patient_profile_model.dart';
import 'package:mobi_care/models/get_symptoms_model.dart';
import 'package:mobi_care/shared/constants/constants.dart';
import 'package:mobi_care/shared/network/remote/dio_helper.dart';
import 'package:mobi_care/shared/network/remote/end_point.dart';

import '../../../../models/patient_doctor_list_model.dart';
import 'states.dart';

class PatientProfileCubit extends Cubit<PatientProfileStates> {
  PatientProfileCubit() : super(PatientProfileInitiateState());

  static PatientProfileCubit get(BuildContext context) => BlocProvider.of(context);

  bool ? isPrescriptionVisible;
  bool ? isFollowUpWithVisible;
  bool ? isSymptomsVisible;


  void changePrescriptionVisibility(bool isVisible){
    isPrescriptionVisible = isVisible;
    emit(PatientProfileChangePrescriptionContainerVisibility());
  }

  void changeFollowUpWithVisibility(bool isVisible){
    isFollowUpWithVisible = isVisible;
    emit(PatientProfileChangeFollowUpWithContainerVisibility());
  }

  void changeSymptomsVisibility(bool isVisible){
    isSymptomsVisible = isVisible;
    emit(PatientProfileChangeSymptomsContainerVisibility());
  }

  String ? token;
  void getNewAccessToken(){
    emit(GetNewAccessTokenLoadingState());
    DioHelper.postData(
      url: GET_NEW_ACCESS_TOKEN,
      data: {
        'token': asPatientModel!.refreshToken!,
      },
    ).then((value) {
      accessToken = value.data['accesstoken'];
      token = value.data['accesstoken'];
      print(accessToken);
      emit(GetNewAccessTokenSuccessfullyState());
      getSymptoms();
      getDoctors();
    }).catchError((error){
      print(error.toString());
      emit(GetNewAccessTokenErrorState(error: error));
    });
  }

  GetPatientProfileModel ? patientProfileModel ;
  void getPatientProfile(){
    emit(GetPatientProfileLoadingState());
    DioHelper.getData(
        path: '${Get_Patient_Profile}${asPatientModel!.data!.iD}' ,
        token: asPatientModel!.accessToken
    ).then((value) {
      print(value.data);
      patientProfileModel = GetPatientProfileModel.fromJson(value.data);
      print('PatientProfileModel : ^^^^^^^^^^^^^^^^^^^^^^^');
      print(patientProfileModel);
      print(patientProfileModel!.data!.fName);
      emit(GetPatientProfileSuccessfullyState());
    }).catchError((error) {
      print(error.toString());
      emit(GetPatientProfileErrorState());
    });
  }

  GetSymptomsModel ? symptoms ;

  void getSymptoms(){
    emit(GetSymptomsLoadingState());
    DioHelper.getData(
      path: Get_Symptoms,
      queryParameters: {
        'id': asPatientModel!.data!.iD!,
      },
      token: token
    ).then((value) {
      symptoms = GetSymptomsModel.fromJson(value.data);
      print(symptoms!.data!.length);
      emit(GetSymptomsSuccessfullyState());
    }).catchError((error){
      print(error.toString());
      emit(GetSymptomsErrorState(error: error.toString()));
    });
  }

  PatientDoctorListModel ? patientDoctorList ;

  void getDoctors(){
    emit(GetDoctorsListLoadingState());
    DioHelper.getData(
      path: Get_Doctors,
      queryParameters: {
        'id': asPatientModel!.data!.iD!,
      },
      token: token,
    ).then((value) {
      patientDoctorList = PatientDoctorListModel.fromJson(value.data);
      print(patientDoctorList!.data!.length);
      print(patientDoctorList!.data);
      print(patientDoctorList!);
      emit(GetDoctorsListSuccessfullyState());
    }).catchError((error){
      print(error.toString());
      emit(GetDoctorsListErrorState(error: error.toString()));
    });
  }
}