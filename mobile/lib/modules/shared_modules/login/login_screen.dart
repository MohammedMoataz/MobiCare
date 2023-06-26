import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobi_care/layouts/patient_layout/patient_layout.dart';
import 'package:mobi_care/shared/components/components.dart';
import 'package:mobi_care/shared/components/text_button_component.dart';
import 'package:mobi_care/shared/components/text_form_field_component.dart';
import 'package:mobi_care/shared/constants/constants.dart';
import 'package:mobi_care/shared/network/local/cache_helper.dart';
import 'package:mobi_care/shared/styles/colors.dart';
import '../../../layouts/doctor_layout/doctor_layout.dart';
import '../../../shared/components/navigate_component.dart';
import '../../../shared/components/toast_component.dart';
import '../../patinet_modules/register/register_screen.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit , LoginStates>(
        listener: (context, state){
          if(state is MainPatientLoginErrorState){
            showToast(text: state.error, toastStates: ToastStates.ERROR);
          }
          else if(state is MainDoctorLoginErrorState){
            showToast(text: state.error, toastStates: ToastStates.ERROR);
          }else if(state is MainPatientLoginSuccessState && asPatientModel != null){
            navigateAndFinish(context: context, widget: PatientLayout());
          }else if(state is MainDoctorLoginSuccessState && asDoctorModel != null){
            navigateAndFinish(context: context, widget: DoctorLayout());
          }
          if(state is MainDoctorLoginSuccessState){
            navigateAndFinish(context: context, widget: DoctorLayout());
          }
          if(state is MainPatientLoginSuccessState){
            navigateAndFinish(context: context, widget: PatientLayout());
          }
        },
        builder: (context, state) {
          LoginCubit cubit = LoginCubit.get(context);
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 400,
                    width: double.infinity,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        SvgPicture.asset(
                          'assets/svg/shapes/shape_7.svg',
                          width: double.infinity,
                          height: 500,
                          alignment: AlignmentDirectional.topStart,
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(start: 30.0),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 50,
                                  fontWeight: FontWeight.w400
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          DefaultTextFormField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              validation: (value){
                                if(value!.isEmpty) {
                                  return 'Email address must be not empty';
                                } else if(!value.contains('@')) {
                                  return 'Email address must have a \'@\' character';
                                }
                                return null;
                              },
                              fieldName: 'Email',
                              prefixIcon: Icons.email_outlined,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          DefaultTextFormField(
                              controller: passwordController,
                              keyboardType: TextInputType.text,
                              validation: (value){
                                if(value!.isEmpty) {
                                  return 'Password must be not empty';
                                }
                                return null;
                              },
                              fieldName: 'Password',
                              prefixIcon: Icons.lock_outline,
                              onSubmit: (value){
                                if(formKey.currentState!.validate()){
                                  cubit.userLogin(
                                      email: emailController.text,
                                      password: passwordController.text
                                  );
                                }
                              },
                              obscureText: cubit.isPassword,
                              suffixIcon: cubit.suffix,
                              onPressedSuffixIcon: (){
                                cubit.changePasswordVisibility();
                              },
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Spacer(),
                              DefaultTextButton(
                                  text: 'Forgot password?',
                                  function: (){},
                                  textColor: primaryColor1BA,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          ConditionalBuilder(
                            condition: state is! LoginLoadingFirebaseState,
                            builder: (context) => DefaultButton(
                                text: 'LOGIN' ,
                                backgroundColor: primaryColor1BA,
                                function: (){
                                  if(formKey.currentState!.validate()){
                                    cubit.login(
                                        email: emailController.text,
                                        password: passwordController.text,
                                    );
                                  }
                                }
                            ),
                            fallback: (context)=> Center(child: CircularProgressIndicator()),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                  'Don\'t have an account?',
                              ),
                              DefaultTextButton(
                                  text: 'Register now',
                                  textColor: primaryColor1BA,
                                  function: (){
                                    navigateTo(
                                      context: context ,
                                      widget: RegisterScreen(),
                                    );
                                  }
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
