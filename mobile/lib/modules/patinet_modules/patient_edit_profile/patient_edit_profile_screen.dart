import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/parser.dart';
import 'package:mobi_care/models/get_patient_profile_model.dart';
import 'package:mobi_care/shared/components/components.dart';
import 'package:mobi_care/shared/constants/constants.dart';
import '../../../shared/styles/colors.dart';
import '../patient_profile/cubit/cubit.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';


class PatientEditProfileScreen extends StatelessWidget {

  final GetPatientProfileModel model;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  DateTime dateOfBirth = DateTime.now();
  bool isSymptomsVisible = true;
  TextEditingController symptomController = TextEditingController();

  PatientEditProfileScreen({super.key, required this.model});

  List<int> addItemsInWeightList() {
    List<int> widthList = [];
    for (int i = 4; i <= 200; i++) {
      widthList.add(i);
    }
    return widthList;
  }

  List<int> addItemsInHeightList() {
    List<int> widthList = [];
    for (int i = 90; i <= 190; i++) {
      widthList.add(i);
    }
    return widthList;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PatientEditProfileCubit, PatientEditProfileStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        PatientEditProfileCubit cubit = PatientEditProfileCubit.get(context);
        dateOfBirthController.text = PatientProfileCubit.get(context).patientProfileModel!.data!.dOB.toString();
        firstNameController.text = PatientProfileCubit.get(context).patientProfileModel!.data!.fName!;
        lastNameController.text = PatientProfileCubit.get(context).patientProfileModel!.data!.lName!;
        emailController.text = PatientProfileCubit.get(context).patientProfileModel!.data!.email!;
        addressController.text = PatientProfileCubit.get(context).patientProfileModel!.data!.address!;
        Size size = MediaQuery.of(context).size;

        return Scaffold(
          appBar: AppBar(
            backgroundColor: primaryColor4DC_20,
            actions: [
              TextButton(
                onPressed: (){
                cubit.editPatientProfile(firstName: firstNameController.text,
                    lastName: lastNameController.text,
                    email: emailController.text,
                    password: passwordController.text,
                    address: addressController.text,
                    weight: int.parse(cubit.weightValue),
                    height: int.parse(cubit.tallValue),
                    context: context,
                  );
                },
                child: Text(
                  'EDIT',
                  style: TextStyle(
                    color: primaryColor1BA,
                  ),
                ),
              ),
            ],
          ),
          floatingActionButton: InkWell(
            onTap: () {
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
                                'Add symptom' ,
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
                                controller: symptomController,
                                decoration: InputDecoration(
                                  hintText: 'Symptom',
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
                                  cubit.addSymptom(symptom: symptomController.text.toString());
                                  Navigator.pop(context);
                                  symptomController.text = "";
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
            },
            child: Container(
              decoration: BoxDecoration(
                color: primaryColor1BA,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
                child: Text(
                  'Add Symptom',
                  style: TextStyle(
                    color: primaryWhiteColor,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
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
                              height: 140,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: primaryColor4DC_20,
                                  borderRadius: BorderRadiusDirectional.only(
                                    bottomStart: Radius.circular(8),
                                    bottomEnd: Radius.circular(8),
                                  )),
                            )
                          ],
                        ),
                      ),
                      Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          SizedBox(
                            width: 115,
                            child: DefaultImageShape(
                                isMale: model.data!.gender == 0 ? false : true,
                                height: 80,
                                image: 'https://cdn-icons-png.flaticon.com/512/727/727399.png?w=740&t=st=1685896888~exp=1685897488~hmac=d1e52ed88325af9d153a52cc517b162ed28c158ecf2c917d7faa12849488be12',
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
                    '${model.data!.fName} ${model.data!.lName}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Text(
                  model.data!.gender == 0 ? 'Female' : 'Male',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 12,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                      top: 8.0, start: 20.0, end: 20.0, bottom: 70),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: BuildColumnTextField(
                                controller: firstNameController,
                                labelName: 'First Name',
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'First Name can\'t be empty';
                                  }
                                  return "null";
                                }),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: BuildColumnTextField(
                                controller: lastNameController,
                                labelName: 'Last Name',
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Last Name can\'t be empty';
                                  }
                                  return "null";
                                }),
                          ),
                        ],
                      ),
                      BuildColumnTextField(
                          controller: emailController,
                          labelName: 'Email',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Email can\'t be empty';
                            }
                            return "null";
                          }),
                      BuildColumnTextField(
                          controller: passwordController,
                          labelName: 'Password',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password can\'t be empty';
                            }
                            return "null";
                          }),
                      BuildColumnTextField(
                          controller: confirmPasswordController,
                          labelName: 'Confirm Password',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Confirm Password can\'t be empty';
                            } else if (value != passwordController.text) {
                              return 'Confirm Password Filed not match Password Filed';
                            }
                            return "null";
                          }),
                      BuildColumnTextField(
                          controller: addressController,
                          labelName: 'Address',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Address can\'t be empty';
                            }
                            return "null";
                          }),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          CalculateBox(
                            width: size.width * 0.31,
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
                          Spacer(),
                          CalculateBox(
                            width: size.width * 0.31,
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
