import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

class TimePikerSpinnerComponent extends StatelessWidget {
  final Function(DateTime)? onTimeChange;

  const TimePikerSpinnerComponent({
    Key? key,
    required this.onTimeChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TimePickerSpinner(
      is24HourMode: false,
      normalTextStyle: const TextStyle(fontSize: 24, color: Colors.deepOrange),
      highlightedTextStyle: const TextStyle(fontSize: 24, color: Colors.yellow),
      spacing: 50,
      itemHeight: 80,
      isForce2Digits: true,
      onTimeChange: onTimeChange,
    );
  }
}
