import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobi_care/modules/shared_modules/articles/articles_screen.dart';
import '../../../modules/patinet_modules/emergency_numbers/emergency_numbers_screen.dart';
import '../../../modules/patinet_modules/patient_prescriptions/patient_prescriptions_screen.dart';
import '../../../modules/patinet_modules/patient_profile/patient_profile_screen.dart';
import '../../../modules/shared_modules/login/login_screen.dart';
import '../../../modules/shared_modules/settings/settings_screen.dart';
import '../../../shared/components/navigate_component.dart';
import 'states.dart';

class PatientDrawerLayoutCubit extends Cubit<PatientDrawerLayoutStates>{
  PatientDrawerLayoutCubit() : super(DrawerLayoutInitiateState());

  static PatientDrawerLayoutCubit get(BuildContext context) => BlocProvider.of(context);

  int ? currentIndex;

  void changeScreen(int index , BuildContext context){
    currentIndex = index;
    if(currentIndex == 0){
      navigateTo(context: context, widget: PatientProfileScreen());
    }else if(currentIndex == 1){
      navigateTo(context: context, widget: PatientPrescriptionScreen());
    }else if(currentIndex == 2){
      navigateTo(context: context, widget: ArticleScreen());
    }else if(currentIndex == 3){
      navigateTo(context: context, widget: EmergencyNumbersScreen());
    }
    else if(currentIndex == 4){
      navigateTo(context: context, widget: SettingScreen());
    }else if(currentIndex == 5){
      navigateAndFinish(context: context, widget: LoginScreen());
    }
    emit(DrawerLayoutChangeScreen());
  }
}