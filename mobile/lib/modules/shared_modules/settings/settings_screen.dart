import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobi_care/shared/components/components.dart';

import '../../../shared/styles/colors.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40.0),
                    child: Text(
                      'Settings',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  DefaultSettingItem(
                      icon: Icons.language,
                      labelName: 'Language',
                      widget: Container(
                        decoration: BoxDecoration(
                          color: primaryGreyColorEBF,
                          borderRadius: BorderRadius.circular(8,),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0 , horizontal: 8),
                          child: Row(
                            children: [
                              Text(
                                  'EN'
                              ),
                              Icon(
                                  Icons.keyboard_arrow_down
                              ),
                            ],
                          ),
                        ),
                      ),
                  ),
                  DefaultSettingItem(
                      icon: Icons.wb_sunny_outlined,
                      labelName: 'Light Mode',
                      widget: Icon(
                        Icons.toggle_off_outlined,
                        color: primaryBlackColor_60,
                      )
                  ),
                  DefaultSettingItem(
                      icon: Icons.favorite_border,
                      labelName: 'Help and support',
                      widget: Icon(
                        Icons.navigate_next,
                        color: primaryBlackColor_60,
                      ),
                  ),
                  DefaultSettingItem(
                      icon: Icons.lock_outline,
                      labelName: 'Privacy and security',
                      widget: Icon(
                        Icons.navigate_next,
                        color: primaryBlackColor_60,
                      ),
                  ),
                  DefaultSettingItem(
                      icon: Icons.question_mark_outlined,
                      labelName: 'About',
                      widget: Icon(
                        Icons.navigate_next,
                        color: primaryBlackColor_60,
                      ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
