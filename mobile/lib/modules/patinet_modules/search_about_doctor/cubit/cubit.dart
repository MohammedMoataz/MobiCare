import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobi_care/models/search_doctor_model.dart';
import 'package:mobi_care/shared/network/remote/dio_helper.dart';
import 'package:mobi_care/shared/network/remote/end_point.dart';
import 'states.dart';

class SearchAboutDoctorCubit extends Cubit<SearchAboutDoctorStates> {

  SearchAboutDoctorCubit() : super(SearchAboutDoctorInitiateState());

  static SearchAboutDoctorCubit get(BuildContext context) => BlocProvider.of(context);

  SearchDoctorModel ? searchDoctorModel;

  void searchDoctor({
    required String fName,
  }){
    emit(SearchAboutDoctorLoadingState());
    DioHelper.getData(
      path: SEARCH_DOCTOR_BY_NAME,
      queryParameters: {
        'FN' : fName,
      }
    ).then((value) {
      searchDoctorModel = SearchDoctorModel.fromJson(value.data);
      print('Search about doctor: ');
      print(searchDoctorModel!.data!.length);
      print(searchDoctorModel!.data![0]);
      print(searchDoctorModel!.data![0].email);

      emit(SearchAboutDoctorSuccessfullyState());
    }).catchError((error){
      print(error.toString());
      emit(SearchAboutDoctorErrorState());
    });
  }
}