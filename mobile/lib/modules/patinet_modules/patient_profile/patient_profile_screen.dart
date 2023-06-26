import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobi_care/layouts/patient_layout/cubit/cubit.dart';
import 'package:mobi_care/modules/shared_modules/chat_details/chat_details_screen.dart';
import 'package:mobi_care/shared/components/components.dart';
import 'package:mobi_care/shared/styles/colors.dart';
import '../../../shared/components/navigate_component.dart';
import '../patient_edit_profile/patient_edit_profile_screen.dart';
import '../patient_prescriptions/patient_prescriptions_screen.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class PatientProfileScreen extends StatelessWidget {
  PatientProfileScreen({Key? key}) : super(key: key);

  bool isPrescriptionVisible = true;
  bool isFollowUpWithVisible = true;
  bool isSymptomsVisible = true;
  bool dataLoaded = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PatientProfileCubit , PatientProfileStates>(
      listener: (context, state) {
        if(state is GetPatientProfileSuccessfullyState){
          dataLoaded = true;
        }
      },
      builder: (context, state) {
        PatientProfileCubit cubit = PatientProfileCubit.get(context);
        return Scaffold(
          body: SafeArea(
            child: ConditionalBuilder(
              condition: state is GetPatientProfileSuccessfullyState || dataLoaded,
              builder: (context) => ListView(
                children: [
                  Container(
                    height: 220,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Align(
                          alignment: AlignmentDirectional.topCenter,
                          child: Stack(
                            alignment: AlignmentDirectional.topEnd,
                            children: [
                              Container(
                                height: 180,
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
                        DefaultImageShape(
                          isMale:  cubit.patientProfileModel!.data!.gender! == 0 ? false : true,
                          height: 80,
                          image: 'https://cdn-icons-png.flaticon.com/512/727/727399.png?w=740&t=st=1685896888~exp=1685897488~hmac=d1e52ed88325af9d153a52cc517b162ed28c158ecf2c917d7faa12849488be12',
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      '${cubit.patientProfileModel!.data!.fName!} ${cubit.patientProfileModel!.data!.lName!}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Text(
                    cubit.patientProfileModel!.data!.gender! == 0 ? 'Female' : 'Male',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 12,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0 , horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: (){
                                  navigateTo(context: context, widget: PatientEditProfileScreen(model: cubit.patientProfileModel!,));
                                },
                                child: Text(
                                  'Edit Profile',
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            OutlinedButton(
                              onPressed: (){
                                navigateTo(
                                  context: context,
                                  widget: PatientEditProfileScreen(model: cubit.patientProfileModel!),
                                );
                              },
                              child: Icon(
                                Icons.edit,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                            height: 20
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.date_range,
                                  size: 28,
                                  color: primaryColor1BA,
                                ),
                                SizedBox(width: 20,),
                                Text(
                                  '${cubit.patientProfileModel!.data!.dOB!}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  size: 28,
                                  color: primaryColor1BA,
                                ),
                                SizedBox(width: 20,),
                                Text(
                                  '${cubit.patientProfileModel!.data!.address!}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.height,
                                  size: 28,
                                  color: primaryColor1BA,
                                ),
                                SizedBox(width: 20,),
                                Text(
                                  '${cubit.patientProfileModel!.data!.height == null ? 140 : cubit.patientProfileModel!.data!.height!}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.line_weight,
                                  size: 28,
                                  color: primaryColor1BA,
                                ),
                                SizedBox(width: 20,),
                                Text(
                                  '${cubit.patientProfileModel!.data!.weight == null ? 40 : cubit.patientProfileModel!.data!.weight!}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.email,
                                  size: 28,
                                  color: primaryColor1BA,
                                ),
                                SizedBox(width: 20,),
                                Text(
                                  '${cubit.patientProfileModel!.data!.email!}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(
                                  cubit.patientProfileModel!.data!.gender! == 0 ? Icons.female :Icons.male,
                                  size: 28,
                                  color: primaryColor1BA,
                                ),
                                SizedBox(width: 20,),
                                Text(
                                  '${cubit.patientProfileModel!.data!.gender! == 0 ? 'Female' : 'Male'}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.phone,
                                  size: 28,
                                  color: primaryColor1BA,
                                ),
                                SizedBox(width: 20,),
                                Text(
                                  '${cubit.patientProfileModel!.data!.phone!}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                            height: 20
                        ),
                        Divider(),
                        InkWell(
                          onTap: (){
                            isPrescriptionVisible = !isPrescriptionVisible;
                            cubit.changePrescriptionVisibility(isPrescriptionVisible);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Row(
                              children: [
                                Text(
                                  'Prescriptions',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Spacer(),
                                Icon(
                                    Icons.keyboard_arrow_down
                                ),
                              ],
                            ),
                          ),
                        ),
                        if(isPrescriptionVisible)
                          Column(
                            children: [
                              BuildPrescriptionItem(dateTime: '5 / 10 / 2021', doctorName: 'Dr.Ali'),
                              BuildPrescriptionItem(dateTime: '5 / 10 / 2021', doctorName: 'Dr.Ali'),
                            ],
                          ),
                        if(isPrescriptionVisible)
                          SizedBox(
                            height: 10,
                          ),
                        if(isPrescriptionVisible)
                          SizedBox(
                            width: double.infinity,
                            child: InkWell(
                              onTap: (){
                                navigateTo(context: context, widget: PatientPrescriptionScreen());
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 15.0),
                                child: Text(
                                  'SEE MORE',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        Divider(),
                        InkWell(
                          onTap: (){
                            isFollowUpWithVisible = !isFollowUpWithVisible;
                            cubit.changeFollowUpWithVisibility(isFollowUpWithVisible);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Row(
                              children: [
                                Text(
                                  'Follow up with',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Spacer(),
                                Icon(
                                    Icons.keyboard_arrow_down
                                ),
                              ],
                            ),
                          ),
                        ),
                        if(isFollowUpWithVisible)
                          ConditionalBuilder(
                            condition: cubit.patientProfileModel!.data!.doctors!.isNotEmpty,
                            builder: (context) => Column(
                              children: [
                                for(int i = 0 ; i < cubit.patientProfileModel!.data!.doctors!.length ; i++)
                                  DefaultFollowUpWithItem(
                                    function: (){
                                      PatientLayoutCubit.get(context).createChat(receiverUId: cubit.patientProfileModel!.data!.doctors![i].fUID!);
                                      navigateTo(
                                          context: context,
                                          widget: ChatDetailsScreen(
                                            phone: cubit.patientProfileModel!.data!.doctors![i].phone!,
                                            name: 'Dr. ${cubit.patientProfileModel!.data!.doctors![i].fName} ${cubit.patientProfileModel!.data!.doctors![i].lName}',
                                            isMale: cubit.patientProfileModel!.data!.doctors![i].gender == 0 ? false : true,
                                            fuid: cubit.patientProfileModel!.data!.doctors![i].fUID!,
                                            isDoctor: true,
                                          )
                                      );
                                    },
                                    isMale: cubit.patientProfileModel!.data!.doctors![i].gender == 0 ? false : true,
                                    image: 'https://img.freepik.com/free-photo/smiling-doctor-with-strethoscope-isolated-grey_651396-974.jpg?w=1060&t=st=1677180364~exp=1677180964~hmac=322f62b372fd430840916df2f143ee731df2389d1888b370c1725cb50008f371',
                                    name: '${cubit.patientProfileModel!.data!.doctors![i].fName} ${cubit.patientProfileModel!.data!.doctors![i].lName}',
                                    specialization: cubit.patientProfileModel!.data!.doctors![i].specialization!,
                                  ),
                              ],
                            ),
                            fallback: (context) => Column(
                              children: [
                                SvgPicture.asset(
                                  'assets/svg/doctors_not_found.svg',
                                  height: 120,
                                  width: 120,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text('Doctors you follow with don\'t found'),
                              ],
                            ),
                          ),
                        Divider(),
                        InkWell(
                          onTap: (){
                            isSymptomsVisible = !isSymptomsVisible;
                            cubit.changeSymptomsVisibility(isSymptomsVisible);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Row(
                              children: [
                                Text(
                                  'Symptoms',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Spacer(),
                                Icon(
                                    Icons.keyboard_arrow_down
                                ),
                              ],
                            ),
                          ),
                        ),
                        if(isSymptomsVisible)
                          ConditionalBuilder(
                            condition: cubit.patientProfileModel!.data!.symptoms!.isNotEmpty,
                            builder: (context) => SizedBox(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                child: Wrap(
                                  children: [
                                    for(int i = 0 ; i < cubit.patientProfileModel!.data!.symptoms!.length ; i++)
                                      DefaultSymptomItem(
                                        nameOfSymptom: cubit.patientProfileModel!.data!.symptoms![i].symptom!,
                                      ),
                                  ],
                                ),
                              ),
                            ),
                            fallback: (context) => Column(
                              children: [
                                SvgPicture.asset(
                                  'assets/svg/symptoms_not_found.svg',
                                  height: 120,
                                  width: 120,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text('There is no symptoms'),
                              ],
                            ),
                          ),
                      ],
                    ),
                  )
                ],
              ),
              fallback: (context) => const Center(child: CircularProgressIndicator(),),
            ),
          ),
        );
      },
    );
  }
}
