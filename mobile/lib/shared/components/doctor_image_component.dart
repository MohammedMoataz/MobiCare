import 'package:flutter/material.dart';

import '../styles/colors.dart';

class DoctorImageComponent extends StatelessWidget {

  String image;
  double height;

  DoctorImageComponent({
    required this.image,
    this.height = 105,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: height,
          width: height,
          decoration: BoxDecoration(
            color: primaryWhiteColor,
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        Container(
          height: height-5,
          width: height-5,
          decoration: BoxDecoration(
            color: primaryWhiteColor,
            borderRadius: BorderRadius.circular(25),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Image.network(
            image,
            width: height/2,
            height: height/2,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
