import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobi_care/models/add_symptoms_model.dart';
import 'package:mobi_care/models/edit_patient_profile_model.dart';
import 'package:mobi_care/modules/patinet_modules/patient_profile/cubit/cubit.dart';
import 'package:mobi_care/modules/patinet_modules/patient_profile/patient_profile_screen.dart';
import 'package:mobi_care/shared/components/navigate_component.dart';
import 'package:mobi_care/shared/constants/constants.dart';
import 'package:mobi_care/shared/network/remote/dio_helper.dart';
import 'package:mobi_care/shared/network/remote/end_point.dart';

import 'states.dart';

class PatientEditProfileCubit extends Cubit<PatientEditProfileStates> {
  PatientEditProfileCubit() : super(PatientEditProfileInitiateState());

  static PatientEditProfileCubit get(BuildContext context) => BlocProvider.of(context);

  DateTime ? datePiker;
  bool ? isSymptomsVisible;

  void selectDatePiker(DateTime newDatePiker){
    datePiker = newDatePiker;
    emit(PatientEditProfileSelectDate());
  }
  void changeSymptomsVisibility(bool isVisible){
    isSymptomsVisible = isVisible;
    emit(PatientProfileChangeSymptomsContainerVisibility());
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

  AddSymptomsModel ? addSymptomsModel;
  void addSymptom({
    required String symptom,
  }){
    emit(AddSymptomLoadingState());
    DioHelper.postData(
      url: Add_Symptom,
      data: {
        'id': asPatientModel!.data!.iD!,
        'symptom': symptom,
      },
    ).then((value) {
      addSymptomsModel = AddSymptomsModel.fromJson(value.data);
      print(value.data['message']);
      emit(AddSymptomSuccessfullyState());
    }).catchError((error){
      print(error.toString());
      emit(AddSymptomErrorState());
    });
  }
  EditPatientProfileModel ? editPatientProfileModel;
  void editPatientProfile({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String address,
    required int weight,
    required int height,
    required BuildContext context,
  }){
    emit(EditPatientProfileLoadingState());
    DioHelper.patchData(
      token: asPatientModel!.accessToken,
      url: Edit_Patient_profile,
      data: {
        'STATUS': 'Active',
        'PATIENT_FIRST_NAME' : firstName,
        'PATIENT_LAST_NAME' : lastName,
        'PATIENT_EMAIL' : email,
        'PATIENT_PASSWORD' : password,
        'PATIENT_ADDRESS' : address,
        'DOB' : asPatientModel!.data!.dOB,
        'PATIENT_GENDER' : asPatientModel!.data!.gender,
        'PATIENT_WEIGHT' : weight,
        'PATIENT_HEIGHT' : height,
        'FUID' : uId,
      },
    ).then((value) {
      print(value.data);
      print('################ Edit Patient #################');
      editPatientProfileModel = EditPatientProfileModel.fromJson(value.data);
      print(editPatientProfileModel);
      print(editPatientProfileModel!.data![0].height);
      PatientProfileCubit.get(context).patientProfileModel!.data!.height = editPatientProfileModel!.data![0].height;
      PatientProfileCubit.get(context).patientProfileModel!.data!.weight = editPatientProfileModel!.data![0].weight;
      PatientProfileCubit.get(context).patientProfileModel!.data!.fName = editPatientProfileModel!.data![0].fName;
      PatientProfileCubit.get(context).patientProfileModel!.data!.lName = editPatientProfileModel!.data![0].lName;
      PatientProfileCubit.get(context).patientProfileModel!.data!.email = editPatientProfileModel!.data![0].email;
      PatientProfileCubit.get(context).patientProfileModel!.data!.address = editPatientProfileModel!.data![0].address;
      emit(EditPatientProfileSuccessfullyState());
      navigateTo(context: context, widget: PatientProfileScreen());
    }).catchError((error) {
      print(error.toString());
      emit(EditPatientProfileErrorState());
    });
  }
}