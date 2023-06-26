import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobi_care/models/doctor_model.dart';
import 'package:mobi_care/models/edit_doctor_profile_model.dart';
import 'package:mobi_care/modules/doctor_modules/doctor_profile_doctor_view/doctor_profile_doctor_view_sceen.dart';
import 'package:mobi_care/shared/components/navigate_component.dart';

import '../../../../shared/constants/constants.dart';
import '../../../../shared/network/remote/dio_helper.dart';
import '../../../../shared/network/remote/end_point.dart';
import 'states.dart';

class DoctorEditProfileCubit extends Cubit<DoctorEditProfileStates> {
  DoctorEditProfileCubit() : super(DoctorEditProfileInitiateState());

  static DoctorEditProfileCubit get(BuildContext context) => BlocProvider.of(context);

//   String ? token;
//   void getNewAccessToken({
//     required String fName,
//     required String lName,
//     required String email,
//     required String address,
//     String ? password,
//     required String bio,
// }){
//     emit(GetNewAccessTokenLoadingState());
//     try{
//       DioHelper.postData(
//         url: GET_NEW_ACCESS_TOKEN,
//         data: {
//           'token': asDoctorModel!.refreshToken!,
//         },
//       ).then((value) {
//         accessToken = value.data['accesstoken'];
//         token = value.data['accesstoken'];
//         print(accessToken);
//         emit(GetNewAccessTokenSuccessfullyState());
//         editDoctorProfile(
//           fName: fName,
//           lName: lName ,
//           address: address ,
//           email: email ,
//           password: password,
//           bio: bio,
//         );
//       });
//     }catch(e){
//       print(e.toString());
//       emit(GetNewAccessTokenErrorState());
//     }
//   }

  EditDoctorModel ? editDoctorModel;
  void editDoctorProfile({
    required String fName,
    required String lName,
    required String email,
    required String address,
    String ? password,
    required String bio,
    required BuildContext context,
  }){
    emit(DoctorEditProfileLoadingState());
    try{
      DioHelper.patchData(
        url: '$Edit_Doctor_Profile${asDoctorModel!.data!.iD}',
        token: asDoctorModel!.accessToken,
        data: {
          'STATUS' : 'Disabled',
          'DOCTOR_FIRST_NAME' : fName,
          'DOCTOR_LAST_NAME' : lName,
          'DOCTOR_EMAIL' : email,
          'DOCTOR_PASSWORD' : password,
          'ADDRESS' : address,
          'GENDER' : asDoctorModel!.data!.gender,
          'DOB' : asDoctorModel!.data!.dOB,
          'PHONE' : asDoctorModel!.data!.phone,
          'SPECIALIZATION' : asDoctorModel!.data!.specialization,
          'BIO' : bio,
          'FUID': uId,
        },
      ).then((value) {
        editDoctorModel = EditDoctorModel.fromJson(value.data);
        // asDoctorModel = DoctorModel.fromJson(value.data);
        print(value.data);
        print('%%%%%%%%%%%%%%%EDIT DOCTOR%%%%%%%%%%%%%%%');
        print(value.data['message']);
        asDoctorModel!.data!.fName = editDoctorModel!.data![0].fName;
        asDoctorModel!.data!.lName = editDoctorModel!.data![0].lName;
        asDoctorModel!.data!.email = editDoctorModel!.data![0].email;
        asDoctorModel!.data!.address = editDoctorModel!.data![0].address;
        asDoctorModel!.data!.bio = editDoctorModel!.data![0].bio;
        emit(DoctorEditProfileSuccessfullyState());
        navigateTo(context: context, widget: DoctorProfileDoctorViewScreen());
      });
    }catch(e){
      print(e.toString());
      emit(DoctorEditProfileErrorState());
    }
  }
}
