import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobi_care/layouts/doctor_layout/cubit/cubit.dart';
import 'package:mobi_care/modules/doctor_modules/add_post/add_post_screen.dart';
import 'package:mobi_care/modules/shared_modules/articles/articles_screen.dart';
import 'package:mobi_care/shared/constants/constants.dart';
import 'package:mobi_care/shared/network/remote/dio_helper.dart';
import 'package:mobi_care/shared/network/remote/end_point.dart';
import '../../../modules/doctor_modules/doctor_profile_doctor_view/doctor_profile_doctor_view_sceen.dart';
import '../../../modules/patinet_modules/patient_prescriptions/patient_prescriptions_screen.dart';
import '../../../modules/shared_modules/login/login_screen.dart';
import '../../../modules/shared_modules/settings/settings_screen.dart';
import '../../../shared/components/components.dart';
import '../../../shared/components/navigate_component.dart';
import '../../../shared/styles/colors.dart';
import 'status.dart';

class DoctorDrawerLayoutCubit extends Cubit<DoctorDrawerLayoutStates>{
  DoctorDrawerLayoutCubit() : super(DoctorDrawerLayoutInitiateState());

  static DoctorDrawerLayoutCubit get(BuildContext context) => BlocProvider.of(context);

  int ? currentIndex;
  TextEditingController patientIdController = TextEditingController();

  void getDoctorProfile(){
    
  }

  void changeScreen(int index , BuildContext context){
    currentIndex = index;
    if(currentIndex == 0){
      navigateTo(context: context, widget: DoctorProfileDoctorViewScreen());
    }else if(currentIndex == 1){
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: SingleChildScrollView(
                child: Container(
                  color: primaryWhiteColor,
                  width: double.infinity,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Add patient to patients list' ,
                        style: TextStyle(
                          color: primaryBlackColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: patientIdController,
                        decoration: InputDecoration(
                          hintText: 'Patient ID',
                          hintStyle: TextStyle(
                            color: primaryWhiteColor.withOpacity(0.7),
                          ),
                          filled: true,
                          fillColor: primaryColor1BA,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      DefaultButton(
                        function: (){
                          assignPatientToDoctor(patientId: patientIdController.text, context: context);
                          Navigator.pop(context);
                          patientIdController.text = "";
                        },
                        text: 'Done',
                        redius: 25,
                        backgroundColor: primaryBlueColor2C8,
                        width: 150,
                        height: 40,
                      ),
                      SizedBox(
                        height: 5,
                      )
                    ],
                  ),
                ),
              ),
            );
          }
      );
    }else if(currentIndex == 2){
      DoctorLayoutCubit.get(context).getPosts();
      navigateTo(context: context, widget: ArticleScreen());
    }else if(currentIndex == 3){
      navigateTo(context: context, widget: SettingScreen());
    }else if(currentIndex == 4){
      navigateAndFinish(context: context, widget: LoginScreen());
    }
    emit(DoctorDrawerLayoutChangeScreen());
  }

  void assignPatientToDoctor({
    required String patientId,
    required BuildContext context,
  }){
    emit(AssignPatientToDoctorLoadingState());
    try{
      DioHelper.postData(
        url: ASSIGN_PATIENT_TO_DOCTOR,
        data: {
          'PATIENT_ID' : patientId,
          'DOCTOR_ID' : asDoctorModel!.data!.iD.toString(),
        },
      ).then((value) {
        print(value.data['message']);
        print('Assign Success');
        Navigator.pop(context);
        patientIdController.text = "";
        emit(AssignPatientToDoctorSuccessfullyState());
      });
    }catch(e){
      print(e.toString());
      emit(AssignPatientToDoctorErrorState());
    }
  }
}