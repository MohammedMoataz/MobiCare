import 'package:flutter/material.dart';

class DefaultTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  Function(String value)? onSubmit;
  final String? Function(String? value) validation;
  Function(String value)? onChange;
  final String fieldName;
  IconData? prefixIcon;
  IconData? suffixIcon;
  Function()? onPressedSuffixIcon;
  bool obscureText = false;
  Function()? onTap;
  int? maxLines = 1;
  int? minLines;
  bool isClickable = true;
  double? redius = 0;

  DefaultTextFormField({
    Key? key,
    required this.controller,
    required this.keyboardType,
    this.onSubmit,
    required this.validation,
    this.onChange,
    required this.fieldName,
    this.prefixIcon,
    this.suffixIcon,
    this.onPressedSuffixIcon,
    this.obscureText = false,
    this.onTap,
    this.maxLines = 1,
    this.minLines,
    this.isClickable = true,
    this.redius = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      enabled: isClickable,
      minLines: minLines,
      maxLines: maxLines,
      obscureText: obscureText,
      controller: controller,
      keyboardType: keyboardType,
      onFieldSubmitted: onSubmit,
      validator: validation,
      onChanged: onChange,
      decoration: InputDecoration(
        labelText: fieldName,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(redius!),
        ),
        prefixIcon: Icon(
          prefixIcon,
        ),
        suffixIcon: IconButton(
          onPressed: onPressedSuffixIcon,
          icon: Icon(
            suffixIcon,
          ),
        ),
      ),
    );
  }
}
