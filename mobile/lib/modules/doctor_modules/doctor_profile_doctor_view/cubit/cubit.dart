import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobi_care/models/get_doctor_profile_model.dart';
import 'package:mobi_care/shared/constants/constants.dart';
import 'package:mobi_care/shared/network/remote/dio_helper.dart';
import 'package:mobi_care/shared/network/remote/end_point.dart';

import 'states.dart';

class DoctorProfileCubit extends Cubit<DoctorProfileStates> {
  DoctorProfileCubit() : super(DoctorProfileInitiateState());

  static DoctorProfileCubit get(BuildContext context) => BlocProvider.of(context);

  String ? token;
  void getNewAccessToken(){
    emit(GetNewAccessTokenLoadingState());
    try{
      DioHelper.postData(
        url: GET_NEW_ACCESS_TOKEN,
        data: {
          'token': asDoctorModel!.refreshToken!,
        },
      ).then((value) {
        accessToken = value.data['accesstoken'];
        token = value.data['accesstoken'];
        print(accessToken);
        emit(GetNewAccessTokenSuccessfullyState());
        getDoctorProfile();
      });
    }catch(error){
      print(error.toString());
      emit(GetNewAccessTokenErrorState());
    }
  }

  GetDoctorProfileModel ? doctorProfileModel;

  void getDoctorProfile(){
    emit(GetDoctorProfileLoadingState());
    try{
      DioHelper.getData(
        token: asDoctorModel!.accessToken,
        path: '${Get_Doctor_Profile}${asDoctorModel!.data!.iD}',
      ).then((value) {
        print(value.data);
        // doctorProfileModel = GetDoctorProfileModel.fromJson(value.data);
        asDoctorModel!.data!.bio = value.data['data'][0][0]['Bio'];
        asDoctorModel!.data!.fName = value.data['data'][0][0]['F_Name'];
        asDoctorModel!.data!.lName = value.data['data'][0][0]['L_Name'];
        asDoctorModel!.data!.email = value.data['data'][0][0]['Email'];
        asDoctorModel!.data!.address = value.data['data'][0][0]['Address'];

        // print(doctorProfileModel!.data![0].email);

        emit(GetDoctorProfileSuccessfullyState());
      });
    }catch(error){
      print(error.toString());
      emit(GetDoctorProfileErrorState());
    }
  }
}