import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobi_care/shared/components/components.dart';
import 'package:mobi_care/shared/components/navigate_component.dart';
import 'package:mobi_care/shared/styles/colors.dart';

import '../../../shared/components/navigate_component.dart';
import '../basic_treatment/screen/screen.dart';

import '../basic_treatment/screen/screen.dart';

class PatientHomeScreen extends StatelessWidget {
  const PatientHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40),
      child: SingleChildScrollView(
        child: Column(
          children: [
            buildHomeItemContainer(
                title: 'Home visit',
                description: 'Choose a specialty and the doctor will come home.',
                buttonText: 'Book a home visit',
                function: (){

                },
                svgPath: 'assets/svg/patient_home/patient_home_1.svg',
            ),
            const SizedBox(
              height: 15,
            ),
            buildHomeItemContainer(
                title: 'First aid tips',
                description: 'Learn the principles of first aid, and ways to prevent diseases.',
                buttonText: 'Browes videos',
                function: (){
                  navigateTo(context: context, widget: Screen());
                },
                svgPath: 'assets/svg/patient_home/patient_home_2.svg'
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHomeItemContainer({
    required String title,
    required String description,
    required String buttonText,
    required Function() function,
    required String svgPath
  }){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        decoration: BoxDecoration(
          color: primaryColor60D_10 ,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(title , style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: Text(
                        description ,
                        style: TextStyle(
                            fontSize: 11 ,
                            color: primaryGreyColor808,
                        ),
                        maxLines: 3,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: DefaultButton(
                        function: function,
                        text: buttonText,
                        width: 150,
                        redius: 15,
                        fontSize: 12,
                        height: 40
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(svgPath),
            ),
          ],
        ),
      ),
    );
  }
}
