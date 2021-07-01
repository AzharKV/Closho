import 'package:closho/constants/colors.dart';
import 'package:flutter/material.dart';

class RegistrationTextField extends StatelessWidget {
  const RegistrationTextField({
    Key? key,
    required this.hintText,
    required this.textInputType,
    required this.iconData,
    required this.controller,
    required this.validator,
  }) : super(key: key);

  final String hintText;
  final TextInputType textInputType;
  final IconData iconData;
  final TextEditingController controller;
  final FormFieldValidator validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: customBlack,
      keyboardType: textInputType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: customBlack),
        prefixIcon: Icon(iconData, color: customBlack),
        border: UnderlineInputBorder(borderSide: BorderSide(color: customBlack)),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: customBlack)),
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: customBlack)),
      ),
      validator: validator,
    );
  }
}
