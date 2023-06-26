import 'package:flutter/material.dart';
import 'components.dart';

class DoctorChatComponent extends StatelessWidget {

  String image;
  bool isMale;
  String name;
  int numberOfMassages;
  Function() function;

  DoctorChatComponent({
    required this.image ,
    required this.isMale ,
    required this.name ,
    required this.numberOfMassages ,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DefaultImageShape(
          isMale: isMale,
          height: 50,
          image: image
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          name,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14.0,
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.menu),
        ),
      ],
    );
  }
}
