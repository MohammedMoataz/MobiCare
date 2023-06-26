import 'package:flutter/material.dart';

class DefaultTextButton extends StatelessWidget {
  String text;

  Function() function;
  Color textColor;

  DefaultTextButton({
    super.key,
    required this.text,
    required this.function,
    this.textColor = Colors.teal
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: function,
      child: Text(
        text.toUpperCase(),
        style: TextStyle(
          color: textColor,
        ),
      ),
    );
  }
}
