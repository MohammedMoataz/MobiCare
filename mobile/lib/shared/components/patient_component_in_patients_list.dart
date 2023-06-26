import 'package:flutter/material.dart';

import '../styles/colors.dart';
import 'components.dart';

class PatientComponentInPatientsList extends StatelessWidget {

  String image;
  bool isMale;
  String name;
  Function() function;

  PatientComponentInPatientsList({
    required this.image ,
    required this.isMale ,
    required this.name ,
    required this.function
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DefaultImageShape(
            isMale: isMale,
            image: image,
            height: 60
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            name,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.0,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        DefaultButton(
            function: function,
            text: 'View Profile',
            width: 130,
            backgroundColor: primaryColor1BA,
            redius: 25,
            height: 40,
            fontSize: 14
        ),
      ],
    );
  }
}
