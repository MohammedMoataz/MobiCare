import 'package:flutter/material.dart';

void navigateAndFinish({
  required BuildContext context,
  required Widget widget,
}){
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => widget),
  );
}

void navigateTo({
  required BuildContext context,
  required Widget widget,
}){
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => widget),
  );
}
