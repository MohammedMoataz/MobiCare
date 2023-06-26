import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobi_care/models/search_doctor_model.dart';
import 'package:mobi_care/modules/patinet_modules/doctor_profile_patient_view/cubit/cubit.dart';
import 'package:mobi_care/modules/shared_modules/chat_details/chat_details_screen.dart';
import 'package:mobi_care/shared/components/components.dart';
import 'package:mobi_care/shared/components/doctor_image_component.dart';
import 'package:mobi_care/shared/components/navigate_component.dart';
import 'package:mobi_care/shared/styles/colors.dart';
import 'package:table_calendar/table_calendar.dart';

import '../payment/payment_screen.dart';
import 'cubit/states.dart';

class DoctorProfilePatientViewScreen extends StatelessWidget {

  final Data dataModel;
  DoctorProfilePatientViewScreen({required this.dataModel});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DoctorProfilePatientViewCubit(),
      child: BlocConsumer<DoctorProfilePatientViewCubit , DoctorProfilePatientViewStates>(
        listener: (context, state) {

        },
        builder: (context, state) {
          DoctorProfilePatientViewCubit cubit = DoctorProfilePatientViewCubit.get(context);
          return SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
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
                                  SizedBox(
                                    width: 50,
                                  ),
                                  Text(
                                    'Appointment',
                                    style: TextStyle(
                                      color: primaryBlackColor,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                  onTap: (){
                                    cubit.createChat(receiverUId: dataModel.fUID!);
                                    navigateTo(context: context, widget: ChatDetailsScreen(fuid: dataModel.fUID!, name: 'Dr. ${dataModel.fName!} ${dataModel.lName!}', isDoctor: true, isMale: dataModel.gender == 0 ? false : true, phone: dataModel.phone!,));
                                  },
                                  child: SvgPicture.asset('assets/icons/chat.svg' , width: 60,),
                                ),
                                DoctorImageComponent(
                                  image: 'https://img.freepik.com/premium-vector/graphic-element-printing-poster-banner-website-cartoon-flat-vector-illustration_755718-18.jpg?w=740',
                                ),
                                InkWell(
                                  onTap: () async{
                                    await FlutterPhoneDirectCaller.callNumber(dataModel.phone.toString());
                                  },
                                  child: SvgPicture.asset('assets/icons/telephone.svg' , width: 60,),
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
                                  'Dr. ${dataModel.fName} ${dataModel.lName}',
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
                                  '${dataModel.specialization}',
                                  style: TextStyle(
                                    color: primaryBlackColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                if(dataModel.rate!.round() == 1)
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
                                        '${dataModel!.rate}*',
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
                                        '${dataModel!.reviewsNo} Reviews',
                                        style: TextStyle(
                                          color: primaryGreyColor808,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                if(dataModel!.rate!.round() == 2)
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
                                        '${dataModel!.rate}*',
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
                                        '${dataModel!.reviewsNo} Reviews',
                                        style: TextStyle(
                                          color: primaryGreyColor808,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                if(dataModel!.rate!.round() == 3)
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
                                        '${dataModel!.rate}*',
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
                                        '${dataModel!.reviewsNo} Reviews',
                                        style: TextStyle(
                                          color: primaryGreyColor808,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                if(dataModel.rate!.round() == 4)
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
                                        '${dataModel.rate}*',
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
                                        '${dataModel.reviewsNo} Reviews',
                                        style: TextStyle(
                                          color: primaryGreyColor808,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                if(dataModel.rate!.round() == 5)
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
                                        '${dataModel!.rate}*',
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
                                        '${dataModel.reviewsNo} Reviews',
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
                                                  '${dataModel.patientsNo}',
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
                                                  '${dataModel.experince}yrs',
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
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                                'Birth Date ${dataModel.dOB!}',
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
                                'Lives in ${dataModel.address!}',
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
                              Expanded(
                                child: Text(
                                  'Email ${dataModel.email!}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
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
                                dataModel.gender! == 0 ? Icons.female :Icons.male,
                                size: 28,
                                color: primaryColor1BA,
                              ),
                              SizedBox(width: 20,),
                              Text(
                                'Gender ${dataModel.gender! == 0 ? 'Female' : 'Male'}',
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
                                'Phone ${dataModel.phone!}',
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
                          SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4.0),
                            child: DefaultButton(
                              function: (){
                                navigateTo(context: context, widget: PaymentScreen());
                              },
                              text: 'Book a home visit',
                              redius: 30,
                              backgroundColor: primaryColor1BA,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
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
                        dataModel.bio != null ? dataModel.bio! : 'Write something about you',
                        style: TextStyle(
                          color: primaryBlackColor,
                          fontWeight: FontWeight.w300,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
