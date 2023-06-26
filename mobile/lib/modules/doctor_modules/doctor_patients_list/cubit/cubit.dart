import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobi_care/models/doctor_patient_list_model.dart';

import '../../../../models/get_doctor_profile_model.dart';
import '../../../../models/get_symptoms_model.dart';
import '../../../../shared/constants/constants.dart';
import '../../../../shared/network/remote/dio_helper.dart';
import '../../../../shared/network/remote/end_point.dart';
import 'states.dart';

class DoctorPatientListCubit extends Cubit<DoctorPatientListStates> {
  DoctorPatientListCubit() : super(DoctorPatientListInitiateState());

  static DoctorPatientListCubit get(BuildContext context) => BlocProvider.of(context);

  // String ? token;
  //
  // void getNewAccessToken() {
  //   emit(GetNewAccessTokenLoadingState());
  //   DioHelper.postData(
  //     url: GET_NEW_ACCESS_TOKEN,
  //     data: {
  //       'token': asDoctorModel?.refreshToken,
  //     },
  //   ).then((value) {
  //     accessToken = value.data['accesstoken'];
  //     token = value.data['accesstoken'];
  //     print(accessToken);
  //     print('TOKEN : $token');
  //     emit(GetNewAccessTokenSuccessfullyState());
  //     getDoctorPatients();
  //   }).catchError((error) {
  //     print(error.toString());
  //     emit(GetNewAccessTokenErrorState());
  //   });
  // }
  //
  // // GetDoctorProfileModel ? doctorProfileModel;
  // //
  // // void getDoctorProfile() {
  // //   emit(GetDoctorPatientListLoadingState());
  // //   DioHelper.getData(
  // //     token: token,
  // //     path: '${Get_Doctor_Profile}${asDoctorModel!.data!.iD}',
  // //   ).then((value) {
  // //     print(value.data);
  // //     doctorProfileModel = GetDoctorProfileModel.fromJson(value.data);
  // //     print(doctorProfileModel!.data!.email);
  // //     emit(GetDoctorPatientListSuccessfullyState());
  // //   }).catchError((error) {
  // //     print(error.toString());
  // //     emit(GetDoctorPatientListErrorState());
  // //   });
  // // }
  // DoctorPatientListModel ? doctorPatientListModel;
  //
  // void getDoctorPatients(){
  //   emit(GetDoctorPatientListLoadingState());
  //   DioHelper.getData(
  //     token: token,
  //     path: '${GET_DOCTOR_PATIENTS}${asDoctorModel!.data!.iD}',
  //   ).then((value) {
  //     print(value.data);
  //     doctorPatientListModel = DoctorPatientListModel.fromJson(value.data);
  //     print(doctorPatientListModel!.data![0].fName);
  //     emit(GetDoctorPatientListSuccessfullyState());
  //   }).catchError((error) {
  //     print(error.toString());
  //     emit(GetDoctorPatientListErrorState());
  //   });
  // }

  GetSymptomsModel ? symptoms ;

  // Future<void> getSymptoms({
  //   required int id
  // }){
  //   emit(GetSymptomsLoadingState());
  //   return DioHelper.getData(
  //       path: Get_Symptoms,
  //       queryParameters: {
  //         'id': id,
  //       },
  //   ).then((value) {
  //     symptoms = GetSymptomsModel.fromJson(value.data);
  //     print(symptoms!.data!.length);
  //     print(symptoms);
  //     print('##############');
  //     emit(GetSymptomsSuccessfullyState());
  //   }).catchError((error){
  //     print(error.toString());
  //     emit(GetSymptomsErrorState(error: error.toString()));
  //   });
  // }

}