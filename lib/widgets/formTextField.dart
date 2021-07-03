import 'package:closho/constants/colors.dart';
import 'package:closho/constants/constVariables.dart';
import 'package:flutter/material.dart';

class FormTextField extends StatelessWidget {
  const FormTextField({
    Key? key,
    required this.controller,
    required this.textInputType,
    required this.validator,
    required this.text,
  }) : super(key: key);

  final TextEditingController controller;
  final TextInputType textInputType;
  final String? Function(String?) validator;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      validator: validator,
      cursorColor: customBlack,
      minLines: 1,
      maxLines: textInputType == TextInputType.multiline ? 3 : 1,
      decoration: InputDecoration(
          hintText: text,
          labelText: text,
          hintStyle: blackText,
          labelStyle: blackText,
          alignLabelWithHint: true,
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          errorBorder: outlineInputErrorBorder,
          focusedErrorBorder: outlineInputErrorBorder),
    );
  }
}