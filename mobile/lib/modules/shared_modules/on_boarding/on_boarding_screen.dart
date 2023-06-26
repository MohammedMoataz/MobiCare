import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../models/on_boarding_model.dart';
import '../../../shared/components/navigate_component.dart';
import '../../../shared/network/local/cache_helper.dart';
import '../login/login_screen.dart';
import '/shared/styles/colors.dart';


class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  bool isLast = false;
  PageController boardingController = PageController();
  List<BoardingModel> boarding = [
    BoardingModel(
        picture: 'assets/svg/on_boarding/on_boarding_1.svg',
        title: 'Facilitate communication' ,
        body: 'MobiCare is a healthcare system that allows communication between the doctor and his patients',
    ),
    BoardingModel(
        picture: 'assets/svg/on_boarding/on_boarding_4.svg',
        title: 'Chatting',
        body: 'The doctor and his patient can communicate by chatting you can send text, voice notes, attachments',
    ),
    BoardingModel(
        picture: 'assets/svg/on_boarding/on_boarding_2.svg',
        title: 'Payment',
        body: 'You can book a home visit or doctors can increase the number of patients in his list',
    ),
    BoardingModel(
        picture: 'assets/svg/on_boarding/on_boarding_3.svg',
        title: 'Save Prescription',
        body: 'Your medical prescription will be saved in your profile, get doctor recommendations and many more!',
    ),
    BoardingModel(
        picture: 'assets/svg/on_boarding/on_boarding_5.svg',
        title: 'Uploading a video',
        body: 'The video will be stored and display to all users registered in the system',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            child:const Text(
              'SKIP',
            ),
            onPressed: (){
              submit();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (index){
                  if(index == boarding.length -1){
                    setState(() {
                      isLast = true;
                    });
                  }else{
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                controller: boardingController,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardingController ,
                  count: boarding.length,
                  effect: ExpandingDotsEffect(
                      dotColor: Colors.grey,
                      dotHeight: 10,
                      expansionFactor: 4,
                      dotWidth: 10,
                      spacing: 5,
                      activeDotColor: primaryColor1BA
                  ),
                ),
                const Spacer(),
                FloatingActionButton(
                  onPressed: (){
                    if(isLast){
                      submit();
                    }else{
                      boardingController.nextPage(
                          duration: const Duration(
                              milliseconds: 750
                          ),
                          curve: Curves.fastLinearToSlowEaseIn
                      );
                    }
                  },
                  child: Icon(
                      Icons.arrow_forward
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel boarding) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: SvgPicture.asset(
            boarding.picture
        ),
      ),
      SizedBox(
        height: 30.0,
      ),
      Text(
        boarding.title,
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(
        height: 15.0,
      ),
      Text(
        boarding.body,
        style: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(
        height: 30.0,
      ),
    ],
  );

  void submit(){
    CacheHelper.saveData(key:'onBoarding' , value: true).then((value){
      if(value){
        navigateAndFinish(
            context: context ,
            widget: LoginScreen()
        );
      }
    });

  }
}
