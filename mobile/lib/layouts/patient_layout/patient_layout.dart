import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobi_care/shared/constants/constants.dart';
import '../../modules/patinet_modules/search_about_doctor/search_about_doctor_screen.dart';
import '../../shared/components/drawer_component.dart';
import '../../shared/components/navigate_component.dart';
import '../patient_drawer/patient_drawer_list.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';
import '/shared/styles/colors.dart';
import '../../shared/components/components.dart';

class PatientLayout extends StatelessWidget {
  PatientLayout({Key? key}) : super(key: key);

  GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PatientLayoutCubit(),
      child: BlocConsumer<PatientLayoutCubit , PatientLayoutStates>(
        listener: (context, state) {
        },
        builder: (context, state) {
          PatientLayoutCubit cubit = PatientLayoutCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              elevation: 1,
              backgroundColor: primaryColor1BA,
              actions: [
                IconButton(
                  onPressed: (){
                    navigateTo(
                      context: context,
                      widget: SearchAboutDoctorScreen(),
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
              backgroundColor: Colors.transparent,
              animationCurve: Curves.easeInOut,
              animationDuration: Duration(milliseconds: 800),
              letIndexChange: (index) => true,
            ),
            drawer: Drawer(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    DrawerLayoutHeader(
                      image: 'https://cdn-icons-png.flaticon.com/512/727/727399.png?w=740&t=st=1685896888~exp=1685897488~hmac=d1e52ed88325af9d153a52cc517b162ed28c158ecf2c917d7faa12849488be12',
                        name: '${asPatientModel!.data!.fName} ${asPatientModel!.data!.lName}',
                        isMale: asPatientModel!.data!.gender == 0 ? false : true,
                        email: '${asPatientModel!.data!.email}',
                    ),
                    PatientDrawerLayoutList(),
                  ],
                ),
              ),
            ),
            body: cubit.bottomScreens[cubit.currentIndex],
          );
        },
      ),
    );
  }
}
