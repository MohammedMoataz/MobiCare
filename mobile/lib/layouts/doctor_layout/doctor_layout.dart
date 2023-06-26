import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobi_care/layouts/doctor_drawer/doctor_drawer_list.dart';
import 'package:mobi_care/shared/constants/constants.dart';
import '../../modules/doctor_modules/search_about_patient/search_about_patient_screen.dart';
import '../../shared/components/drawer_component.dart';
import '../../shared/components/navigate_component.dart';
import '../../shared/styles/colors.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class DoctorLayout extends StatelessWidget {
  DoctorLayout({Key? key}) : super(key: key);

  GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();
  bool load = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorLayoutCubit , DoctorLayoutStates>(
      listener: (context, state) {
      },
      builder: (context, state) {
        DoctorLayoutCubit cubit = DoctorLayoutCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            elevation: 1,
            backgroundColor: primaryColor1BA,
            actions: [
              IconButton(
                onPressed: (){
                  navigateTo(
                    context: context,
                    widget: SearchAboutPatientScreen(),
                  );
                },
                icon: Icon(
                  Icons.search,
                  color: primaryWhiteColor,
                ),
              ),
            ],
            centerTitle: true,
            title: Text(
              'MobiCare',
              style: TextStyle(
                  color: primaryWhiteColor
              ),
            ),
          ),
          bottomNavigationBar: CurvedNavigationBar(
            items: cubit.bottomNavIcons,
            buttonBackgroundColor: primaryColor1BA,
            height: 60.0,
            onTap: (index) {
              cubit.changeBottomIndex(index);
            },
            index: cubit.currentIndex,
            color: primaryColorD2F_40,
            backgroundColor: primaryWhiteColor,
            animationCurve: Curves.easeInOut,
            animationDuration: const Duration(milliseconds: 600),
            letIndexChange: (index) => true,
          ),
          drawer: Drawer(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  if(asDoctorModel != null)
                    DoctorDrawerLayoutHeader(
                    image: 'https://img.freepik.com/premium-vector/graphic-element-printing-poster-banner-website-cartoon-flat-vector-illustration_755718-18.jpg?w=740',
                    name: 'Dr. ${asDoctorModel!.data!.fName} ${asDoctorModel!.data!.lName}',
                    email: '${asDoctorModel!.data!.email}',
                    // name: 'Heba Adel',
                    // email: 'Hello',
                  ),
                  if(asDoctorModel == null)
                    CircularProgressIndicator(),
                  DoctorDrawerLayoutList(),
                ],
              ),
            ),
          ),
          body: cubit.bottomScreens[cubit.currentIndex],
        );
      },
    );
  }
}