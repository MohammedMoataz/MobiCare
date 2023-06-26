import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

import '../styles/colors.dart';
import 'components.dart';

void showPopUp({required BuildContext context, required Widget content}) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: content,
        );
      });
}

class ReminderPopUp extends StatelessWidget {
  final TextEditingController controller;
  final TextEditingController descriptionController;
  DateTime? dateTime;
  final cubit;
  final String hintText;
  final Function insertMethod;

  ReminderPopUp({
    super.key,
    required this.controller,
    required this.descriptionController,
    this.dateTime,
    required this.cubit,
    required this.hintText,
    required this.insertMethod,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: primaryWhiteColor,
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: primaryColor1BA,
              child: TimePickerSpinner(
                is24HourMode: false,
                normalTextStyle: TextStyle(
                  color: primaryWhiteColor.withOpacity(0.5),
                  fontWeight: FontWeight.w300,
                  fontSize: 22,
                ),
                highlightedTextStyle: TextStyle(
                  color: primaryWhiteColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 23,
                ),
                spacing: 40,
                itemHeight: 60,
                time: DateTime.now(),
                isForce2Digits: true,
                onTimeChange: (time) {
                  dateTime = time;
                  cubit.changeDateTime(time);
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: controller,
              style: TextStyle(
                color: primaryWhiteColor,
              ),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                  color: primaryWhiteColor.withOpacity(0.7),
                ),
                filled: true,
                fillColor: primaryColor1BA,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              maxLines: 3,
              controller: descriptionController,
              decoration: InputDecoration(
                hintText: 'Description',
                hintStyle: TextStyle(
                  color: primaryWhiteColor.withOpacity(0.7),
                ),
                filled: true,
                fillColor: primaryGreyColor808.withOpacity(0.3),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            DefaultButton(
              function: () {
                insertMethod();
                Navigator.pop(context);
                controller.text = "";
                descriptionController.text = "";
              },
              text: 'Done',
              redius: 25,
              backgroundColor: primaryBlueColor2C8,
              width: 150,
              height: 40,
            ),
            SizedBox(
              height: 5,
            )
          ],
        ),
      ),
    );
  }
}
