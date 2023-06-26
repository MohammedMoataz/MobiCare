import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobi_care/models/doctor_patient_list_model.dart';
import 'package:mobi_care/models/search_doctor_model.dart';
import 'package:mobi_care/shared/constants/constants.dart';
import 'package:mobi_care/shared/network/remote/dio_helper.dart';
import 'package:mobi_care/shared/network/remote/end_point.dart';
import 'states.dart';

class SearchAboutPatientCubit extends Cubit<SearchAboutPatientStates> {

  SearchAboutPatientCubit() : super(SearchAboutPatientInitiateState());

  static SearchAboutPatientCubit get(BuildContext context) => BlocProvider.of(context);

  DoctorPatientListModel ? searchPatientModel;

  void searchPatient({
    required String fName,
  }){
    emit(SearchAboutPatientLoadingState());
    DioHelper.getData(
      token: asDoctorModel!.accessToken,
      path: SEARCH_DOCTOR_PATIENT,
      queryParameters: {
        'FN' : fName,
      }
    ).then((value) {
      searchPatientModel = DoctorPatientListModel.fromJson(value.data);
      print('Search about patient: ');
      print(searchPatientModel!.data!.length);
      print(searchPatientModel!.data![0]);
      print(searchPatientModel!.data![0].email);

      emit(SearchAboutPatientSuccessfullyState());
    }).catchError((error){
      print(error.toString());
      emit(SearchAboutPatientErrorState());
    });
  }
}