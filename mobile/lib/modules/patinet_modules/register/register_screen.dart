import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobi_care/shared/components/text_button_component.dart';
import 'package:mobi_care/shared/components/text_form_field_component.dart';
import '../../../shared/components/components.dart';
import '../../../shared/components/navigate_component.dart';
import '../../../shared/components/toast_component.dart';
import '../../../shared/styles/colors.dart';
import '../../shared_modules/login/login_screen.dart';
import 'cubit/states.dart';
import 'cubit/cubit.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  var formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController questionController = TextEditingController();
  bool ? isMale;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit , RegisterStates>(
        listener: (context, state){
          if(state is RegisterationErrorState){
            showToast(text: state.error.toString(), toastStates: ToastStates.ERROR);
          }else if(state is RegisterationSuccessfullyState){
            navigateAndFinish(context: context, widget: LoginScreen());
          }
        },
        builder: (context, state) {
          Size size = MediaQuery.of(context).size;
          RegisterCubit cubit = RegisterCubit.get(context);
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
                              'Register',
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DefaultTextFormField(
                              controller: firstNameController,
                              keyboardType: TextInputType.text,
                              validation: (value){
                                if(value!.isEmpty) {
                                  return 'Enter your first name, please';
                                }
                                return null;
                              },
                              fieldName: 'First Name',
                              prefixIcon: Icons.person_outlined
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          DefaultTextFormField(
                              controller: lastNameController,
                              keyboardType: TextInputType.text,
                              validation: (value){
                                if(value!.isEmpty) {
                                  return 'Enter your last name, please';
                                }
                                return null;
                              },
                              fieldName: 'Last Name',
                              prefixIcon: Icons.person_outlined
                          ),
                          const SizedBox(
                            height: 15,
                          ),
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
                              fieldName: 'Email Address',
                              prefixIcon: Icons.email_outlined
                          ),
                          const SizedBox(
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
                                  cubit.register(
                                    dateOfBirth: cubit.selectedDate!,
                                    patientAddress: addressController.text,
                                    patientEmail: emailController.text,
                                    patientFirstName: firstNameController.text,
                                    patientGender: cubit.gender!,
                                    patientHeight: cubit.tallValue,
                                    patientLastName: lastNameController.text,
                                    patientPassword: passwordController.text,
                                    patientWeight: cubit.weightValue,
                                  );
                                }
                              },
                              obscureText: cubit.isPassword,
                              suffixIcon: cubit.suffix,
                              onPressedSuffixIcon: (){
                                cubit.changePasswordVisibility();
                              },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Text(
                                'Birth Date',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: primaryColor1BA,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                cubit.selectedDate == null ? '' : '${cubit.selectedDate!.year} / ${cubit.selectedDate!.month} / ${cubit.selectedDate!.day}',
                              ),
                              Spacer(),
                              DefaultButton(
                                function: ()async{
                                  cubit.selectedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime(2000),
                                    firstDate: DateTime(1950),
                                    lastDate: DateTime.now(),
                                  );
                                  cubit.selectBirthDate(cubit.selectedDate!);
                                },
                                text: 'Select',
                                width: 100,
                                height: 40,
                                backgroundColor: primaryColor1BA,
                                fontSize: 14,
                                redius: 10,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          DefaultTextFormField(
                              controller: phoneController,
                              keyboardType: TextInputType.number,
                              validation: (value){
                                if(value!.isEmpty) {
                                  return 'Enter your phone number, please';
                                }
                                return null;
                              },
                              fieldName: 'Phone Number',
                              prefixIcon: Icons.phone_enabled_outlined,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Gender',
                            style: TextStyle(
                              color: primaryColor1BA,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              children: [
                                Radio(
                                    value: 1,
                                    groupValue: cubit.gender,
                                    onChanged: (value){
                                      cubit.changeGenderValue(value as int);
                                    },
                                ),
                                Text('Male'),
                                Spacer(),
                                Radio(
                                  value: 0,
                                  groupValue: cubit.gender,
                                  onChanged: (value){
                                    cubit.changeGenderValue(value as int);
                                  },
                                ),
                                Text(
                                    'Female',
                                  style: TextStyle(

                                  ),
                                ),
                              ],
                            ),
                          ),
                          DefaultTextFormField(
                              controller: addressController,
                              keyboardType: TextInputType.text,
                              validation: (value){
                                if(value!.isEmpty) {
                                  return 'Enter your address number, please';
                                }
                                return null;
                              },
                              fieldName: 'Address',
                              prefixIcon: Icons.home_outlined,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              CalculateBox(
                                width: size.width * 0.35,
                                header: 'Height',
                                child: DropdownButton(
                                  items: cubit.tallItems,
                                  value: cubit.tallValue,
                                  onChanged: (String? newValue) {
                                    if (newValue != null) {
                                      cubit.changeTallValue(newValue);
                                    }
                                  },
                                ),
                              ),
                              CalculateBox(
                                width: size.width * 0.35,
                                header: 'Weight',
                                child: DropdownButton(
                                  items: cubit.weightItems,
                                  value: cubit.weightValue,
                                  onChanged: (String? newValue) {
                                    if (newValue != null) {
                                      cubit.changeWeightValue(newValue);
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          ConditionalBuilder(
                            condition: state is! RegisterLoadingState,
                            builder: (context) => DefaultButton(
                                text: 'Register' ,
                                backgroundColor: primaryColor1BA,
                                function: (){
                                  if(formKey.currentState!.validate()){
                                    cubit.register(
                                      dateOfBirth: cubit.selectedDate!,
                                      patientAddress: addressController.text,
                                      patientEmail: emailController.text,
                                      patientFirstName: firstNameController.text,
                                      patientGender: cubit.gender!,
                                      patientHeight: cubit.tallValue,
                                      patientLastName: lastNameController.text,
                                      patientPassword: passwordController.text,
                                      patientWeight: cubit.weightValue,
                                    );
                                  }
                                }
                            ),
                            fallback: (context)=> const Center(child: CircularProgressIndicator()),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Already have an account?',
                              ),
                              DefaultTextButton(
                                  text: 'Login',
                                  textColor: primaryColor1BA,
                                  function: (){
                                    navigateTo(
                                        context: context ,
                                        widget: LoginScreen()
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
