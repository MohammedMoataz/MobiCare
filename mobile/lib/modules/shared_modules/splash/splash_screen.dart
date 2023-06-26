import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobi_care/layouts/patient_layout/patient_layout.dart';
import '../../../shared/constants/constants.dart';
import '../../../shared/network/local/cache_helper.dart';
import '../login/login_screen.dart';
import '../on_boarding/on_boarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  int timeOfDelayInSeconds = 5;

  @override
  void initState() {
    super.initState();
    late Widget startWidget;
    bool ? onBoarding = CacheHelper.getData(key: 'onBoarding');
    uId = CacheHelper.getData(key: 'uId');
    accessToken = CacheHelper.getData(key: 'token');

    if(onBoarding != null){
      if(uId != null){
        startWidget = PatientLayout();
        print('UID : $uId');
      }
      else {
        startWidget = LoginScreen();
      }
    }else{
      startWidget = OnBoardingScreen();
    }
    Future.delayed(Duration(seconds: timeOfDelayInSeconds) , (){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => startWidget),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                'assets/logo.svg'
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    'MobiCare',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

