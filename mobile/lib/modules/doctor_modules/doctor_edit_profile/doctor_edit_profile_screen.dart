import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobi_care/modules/doctor_modules/doctor_edit_profile/cubit/cubit.dart';
import 'package:mobi_care/modules/doctor_modules/doctor_edit_profile/cubit/states.dart';
import 'package:mobi_care/shared/components/doctor_image_component.dart';
import 'package:mobi_care/shared/constants/constants.dart';

import '../../../shared/components/components.dart';
import '../../../shared/styles/colors.dart';


class DoctorEditProfileScreen extends StatelessWidget {
  DoctorEditProfileScreen({Key? key}) : super(key: key);

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController clinicLocationController = TextEditingController();
  TextEditingController aboutDoctorController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DoctorEditProfileCubit(),
      child: BlocConsumer<DoctorEditProfileCubit , DoctorEditProfileStates>(
        listener: (context, state) {

        },
        builder: (context, state) {
          DoctorEditProfileCubit cubit = DoctorEditProfileCubit.get(context);
          firstNameController.text = asDoctorModel!.data!.fName.toString();
          lastNameController.text = asDoctorModel!.data!.lName.toString();
          emailController.text = asDoctorModel!.data!.email.toString();
          clinicLocationController.text = asDoctorModel!.data!.address.toString();
          aboutDoctorController.text = asDoctorModel!.data!.bio.toString();
          return Scaffold(
            appBar: AppBar(
              backgroundColor: primaryColor4DC_20,
              actions: [
                TextButton(
                  onPressed: (){
                    cubit.editDoctorProfile(
                      fName: firstNameController.text.trim(),
                      lName: lastNameController.text.trim(),
                      email: emailController.text.trim(),
                      address: clinicLocationController.text.trim(),
                      bio: aboutDoctorController.text.trim(),
                      password: passwordController.text.trim(),
                      context: context,
                    );
                  },
                  child: Text('EDIT',),
                ),
              ],
            ),
            body: SafeArea(
              child: ListView(
                children: [
                  SizedBox(
                    height: 180,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Align(
                          alignment: AlignmentDirectional.topCenter,
                          child: Stack(
                            alignment: AlignmentDirectional.topEnd,
                            children: [
                              Container(
                                height: 160,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: primaryColor4DC_20,
                                    borderRadius: BorderRadiusDirectional.only(
                                      bottomStart: Radius.circular(8),
                                      bottomEnd: Radius.circular(8),
                                    )
                                ),
                              )
                            ],
                          ),
                        ),
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            SizedBox(
                              width: 115,
                              child: DoctorImageComponent(
                                height: 80,
                                image: 'https://img.freepik.com/premium-vector/graphic-element-printing-poster-banner-website-cartoon-flat-vector-illustration_755718-18.jpg?w=740',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      'Dr. ${asDoctorModel!.data!.fName} ${asDoctorModel!.data!.lName}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Text(
                    '${asDoctorModel!.data!.specialization}',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 12,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0 , vertical: 15),
                    child: Column(
                      children: [
                        BuildColumnTextField(
                            controller: firstNameController,
                            labelName: 'First Name',
                            validator: (value){
                              if(value!.isEmpty){
                                return 'First Name can\'t be empty';
                              }
                              return "null";
                            }
                        ),
                        BuildColumnTextField(
                            controller: lastNameController,
                            labelName: 'Last Name',
                            validator: (value){
                              if(value!.isEmpty){
                                return 'Last Name can\'t be empty';
                              }
                              return "null";
                            }
                        ),
                        BuildColumnTextField(
                            controller: emailController,
                            labelName: 'Email',
                            validator: (value){
                              if(value!.isEmpty){
                                return 'Email can\'t be empty';
                              }
                              return "null";
                            }
                        ),
                        BuildColumnTextField(
                            controller: passwordController,
                            labelName: 'Password',
                            validator: (value){
                              if(value!.isEmpty){
                                return 'Password can\'t be empty';
                              }
                              return "null";
                            }
                        ),
                        BuildColumnTextField(
                            controller: confirmPasswordController,
                            labelName: 'Confirm Password',
                            validator: (value){
                              if(value!.isEmpty){
                                return 'Confirm Password can\'t be empty';
                              }else if(value != passwordController.text){
                                return 'Confirm Password Filed not match Password Filed';
                              }
                              return "null";
                            }
                        ),
                        BuildColumnTextField(
                            controller: clinicLocationController,
                            labelName: 'Clinic Location',
                            validator: (value){
                              if(value!.isEmpty){
                                return 'Clinic Location can\'t be empty';
                              }
                              return "null";
                            }
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 12,
                            ),
                            Text(
                                'About You'
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              controller: aboutDoctorController,
                              maxLines: 6,
                              decoration: InputDecoration(
                                fillColor: primaryWhiteColor,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              validator: (value){
                                if(value!.isEmpty){
                                  return 'Clinic Location can\'t be empty';
                                }
                                return "null";
                              },
                            ),
                          ],
                        ),
                      ],
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
