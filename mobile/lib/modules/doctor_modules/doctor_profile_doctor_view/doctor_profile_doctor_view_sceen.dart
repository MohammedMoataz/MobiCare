import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobi_care/modules/doctor_modules/doctor_edit_profile/doctor_edit_profile_screen.dart';
import 'package:mobi_care/modules/doctor_modules/doctor_profile_doctor_view/cubit/cubit.dart';
import 'package:mobi_care/modules/doctor_modules/doctor_profile_doctor_view/cubit/states.dart';
import 'package:mobi_care/shared/components/doctor_image_component.dart';
import 'package:mobi_care/shared/components/navigate_component.dart';
import 'package:mobi_care/shared/constants/constants.dart';
import 'package:mobi_care/shared/styles/colors.dart';
import 'package:table_calendar/table_calendar.dart';

class DoctorProfileDoctorViewScreen extends StatelessWidget {
  DoctorProfileDoctorViewScreen({super.key});

  bool loadedDate = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DoctorProfileCubit()..getDoctorProfile(),
      child: BlocConsumer<DoctorProfileCubit , DoctorProfileStates>(
        listener: (context, state) {
          if(state is GetDoctorProfileSuccessfullyState){
            loadedDate = true;
          }
        },
        builder: (context, state) {
          DoctorProfileCubit cubit = DoctorProfileCubit.get(context);
          return SafeArea(
            child: Scaffold(
              body: ConditionalBuilder(
                condition: asDoctorModel!.data!.email != null,
                builder: (context) => SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: primaryColor4DC_20,
                          borderRadius: BorderRadiusDirectional.only(
                            bottomEnd: Radius.circular(35),
                            bottomStart: Radius.circular(35),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 26.0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0 , vertical: 24),
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: primaryWhiteColor,
                                        borderRadius: BorderRadius.circular(15),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 1.0,
                                            spreadRadius: 0.05,
                                            offset: Offset(
                                              1.0,
                                              1.0,
                                            ),
                                          )
                                        ],
                                      ),
                                      child: IconButton(
                                        onPressed: (){
                                          Navigator.pop(context);
                                        },
                                        icon: Icon(Icons.arrow_back_ios_rounded),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 44.0),
                                      child: Text(
                                        'Appointment',
                                        style: TextStyle(
                                          color: primaryBlackColor,
                                          fontSize: 24,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: primaryWhiteColor,
                                        borderRadius: BorderRadius.circular(15),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 1.0,
                                            spreadRadius: 0.05,
                                            offset: Offset(
                                              1.0,
                                              1.0,
                                            ),
                                          )
                                        ],
                                      ),
                                      child: IconButton(
                                        onPressed: (){
                                          navigateTo(context: context, widget: DoctorEditProfileScreen());
                                        },
                                        icon: Icon(Icons.edit),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  DoctorImageComponent(
                                    image: 'https://img.freepik.com/premium-vector/graphic-element-printing-poster-banner-website-cartoon-flat-vector-illustration_755718-18.jpg?w=740',
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Dr. ${asDoctorModel!.data!.fName} ${asDoctorModel!.data!.lName}',
                                    style: TextStyle(
                                      color: primaryBlackColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '${asDoctorModel!.data!.specialization}',
                                    style: TextStyle(
                                      color: primaryBlackColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  if(asDoctorModel!.data!.rate!.round() == 1)
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset('assets/icons/active_star.svg'),
                                        SvgPicture.asset('assets/icons/not_active_star.svg'),
                                        SvgPicture.asset('assets/icons/not_active_star.svg'),
                                        SvgPicture.asset('assets/icons/not_active_star.svg'),
                                        SvgPicture.asset('assets/icons/not_active_star.svg'),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          '${asDoctorModel!.data!.rate}*',
                                          style: TextStyle(
                                            color: primaryColor1BA,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          '${asDoctorModel!.data!.reviewsNo} Reviews',
                                          style: TextStyle(
                                            color: primaryGreyColor808,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  if(asDoctorModel!.data!.rate!.round() == 2)
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset('assets/icons/active_star.svg'),
                                        SvgPicture.asset('assets/icons/active_star.svg'),
                                        SvgPicture.asset('assets/icons/not_active_star.svg'),
                                        SvgPicture.asset('assets/icons/not_active_star.svg'),
                                        SvgPicture.asset('assets/icons/not_active_star.svg'),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          '${asDoctorModel!.data!.rate}*',
                                          style: TextStyle(
                                            color: primaryColor1BA,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          '${asDoctorModel!.data!.reviewsNo} Reviews',
                                          style: TextStyle(
                                            color: primaryGreyColor808,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  if(asDoctorModel!.data!.rate!.round() == 3)
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset('assets/icons/active_star.svg'),
                                        SvgPicture.asset('assets/icons/active_star.svg'),
                                        SvgPicture.asset('assets/icons/active_star.svg'),
                                        SvgPicture.asset('assets/icons/not_active_star.svg'),
                                        SvgPicture.asset('assets/icons/not_active_star.svg'),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          '${asDoctorModel!.data!.rate}*',
                                          style: TextStyle(
                                            color: primaryColor1BA,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          '${asDoctorModel!.data!.reviewsNo} Reviews',
                                          style: TextStyle(
                                            color: primaryGreyColor808,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  if(asDoctorModel!.data!.rate!.round() == 4)
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset('assets/icons/active_star.svg'),
                                        SvgPicture.asset('assets/icons/active_star.svg'),
                                        SvgPicture.asset('assets/icons/active_star.svg'),
                                        SvgPicture.asset('assets/icons/active_star.svg'),
                                        SvgPicture.asset('assets/icons/not_active_star.svg'),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          '${asDoctorModel!.data!.rate}*',
                                          style: TextStyle(
                                            color: primaryColor1BA,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          '${asDoctorModel!.data!.reviewsNo} Reviews',
                                          style: TextStyle(
                                            color: primaryGreyColor808,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  if(asDoctorModel!.data!.rate!.round() == 5)
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset('assets/icons/active_star.svg'),
                                        SvgPicture.asset('assets/icons/active_star.svg'),
                                        SvgPicture.asset('assets/icons/active_star.svg'),
                                        SvgPicture.asset('assets/icons/active_star.svg'),
                                        SvgPicture.asset('assets/icons/active_star.svg'),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          '${asDoctorModel!.data!.rate}*',
                                          style: TextStyle(
                                            color: primaryColor1BA,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          '${asDoctorModel!.data!.reviewsNo} Reviews',
                                          style: TextStyle(
                                            color: primaryGreyColor808,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: primaryWhiteColor,
                                              borderRadius: BorderRadius.circular(15),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey,
                                                  blurRadius: 1.0,
                                                  spreadRadius: 0.05,
                                                  offset: Offset(
                                                    1.0,
                                                    1.0,
                                                  ),
                                                )
                                              ],
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 20.0 , vertical: 10),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    'Patients',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: primaryGreyColor808,
                                                        fontWeight: FontWeight.w400
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    '${asDoctorModel!.data!.patientsNo}',
                                                    style: TextStyle(
                                                        fontSize: 28,
                                                        color: primaryBlackColor,
                                                        fontWeight: FontWeight.w600
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: primaryWhiteColor,
                                              borderRadius: BorderRadius.circular(15),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey,
                                                  blurRadius: 1.0,
                                                  spreadRadius: 0.05,
                                                  offset: Offset(
                                                    1.0,
                                                    1.0,
                                                  ),
                                                )
                                              ],
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 20.0 , vertical: 10),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    'Experience',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: primaryGreyColor808,
                                                        fontWeight: FontWeight.w400
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    '${asDoctorModel!.data!.experince}yrs',
                                                    style: TextStyle(
                                                        fontSize: 30,
                                                        color: primaryBlackColor,
                                                        fontWeight: FontWeight.w500
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                          height: 20
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Column(
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
                                  '${asDoctorModel!.data!.dOB!}',
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
                                  '${asDoctorModel!.data!.address!}',
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
                                  '${asDoctorModel!.data!.email!}',
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
                                  asDoctorModel!.data!.gender! == 0 ? Icons.female :Icons.male,
                                  size: 28,
                                  color: primaryColor1BA,
                                ),
                                SizedBox(width: 20,),
                                Text(
                                  '${asDoctorModel!.data!.gender! == 0 ? 'Female' : 'Male'}',
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
                                  '${asDoctorModel!.data!.phone!}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(top: 24.0 , start: 16 , bottom: 12),                child: Text(
                        'About Doctor',
                        style: TextStyle(
                            color: primaryBlackColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 26
                        ),
                      ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 26.0),
                        child: Text(
                          asDoctorModel!.data!.bio != null ? '${asDoctorModel!.data!.bio.toString()}' : 'Write something about you',
                          style: TextStyle(
                            color: primaryBlackColor,
                            fontWeight: FontWeight.w300,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      SizedBox(
                          height: 20
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(top: 24.0 , start: 16 , bottom: 12),
                        child: Text(
                          'Availability',
                          style: TextStyle(
                              color: primaryBlackColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 26
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 26.0),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: primaryColorD2F,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: TableCalendar(
                                firstDay: DateTime.utc(2010, 10, 16),
                                lastDay: DateTime.utc(2030, 3, 14),
                                focusedDay: DateTime.now(),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4.0 , vertical: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: primaryColorD2F,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 20.0 , vertical: 10),
                                        child: Text(
                                          '11 : 00',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 26,
                                            fontWeight: FontWeight.w300,
                                            color: primaryGreyColor808,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: primaryColorBBF,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 20.0 , vertical: 10),
                                        child: Text(
                                          '14 : 00',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 26,
                                            fontWeight: FontWeight.w300,
                                            color: primaryGreyColor808,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4.0 , vertical: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: primaryColorD2F,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 20.0 , vertical: 10),
                                        child: Text(
                                          '15 : 00',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 26,
                                            fontWeight: FontWeight.w300,
                                            color: primaryGreyColor808,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: primaryColorD2F,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 20.0 , vertical: 10),
                                        child: Text(
                                          '17 : 00',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 26,
                                            fontWeight: FontWeight.w300,
                                            color: primaryGreyColor808,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
                fallback: (context) => Center(child: CircularProgressIndicator()),
              ),
            ),
          );
        },
      ),
    );
  }
}
