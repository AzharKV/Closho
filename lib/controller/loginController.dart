import 'package:closho/constants/strings.dart';
import 'package:closho/services/sharedPref.dart';
import 'package:closho/view/admin/dashBoard.dart';
import 'package:closho/view/client/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> logInFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> adminLoginFormKey = GlobalKey<FormState>();

  final TextEditingController emailField = TextEditingController();
  final TextEditingController passwordField = TextEditingController();
  final TextEditingController phoneField = TextEditingController();

  String? emailValidation(value) {
    if (emailField.text.isEmpty) return "Field Mandatory";
    if (!emailField.text.isEmail) return "Enter Valid Email Address";
    return null;
  }

  String? passwordValidation(value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);

    if (!regExp.hasMatch(passwordField.text))
      return "Password Must Contain One Capital Letter,\n"
          "Small Letter, Special Character,\nWith Minimum Of 8 Characters";
    return null;
  }

  String? phoneValidation(value) {
    if (phoneField.text.isEmpty) return "Field Mandatory";
    if (!phoneField.text.isPhoneNumber) return "Enter Valid Phone Address";
    return null;
  }

  Future<void> login() async {
    if (logInFormKey.currentState!.validate()) {
      await SharedPref().saveInt(isUserSignIn, 1);
      userSignedIn = 1;
      Get.snackbar("Welcome Back", "", snackPosition: SnackPosition.BOTTOM);
      Get.to(() => Home());
    }
  }

  Future<void> registration() async {
    if (registerFormKey.currentState!.validate()) {
      await SharedPref().saveInt(isUserSignIn, 1);
      userSignedIn = 1;
      Get.snackbar("Welcome,", "", snackPosition: SnackPosition.BOTTOM);
      Get.to(() => Home());
    }
  }

  Future<void> adminLogin() async {
    if (adminLoginFormKey.currentState!.validate()) {
      await SharedPref().saveInt(isUserSignIn, 2);
      userSignedIn = 2;
      Get.snackbar("Welcome Back Admin", "",
          snackPosition: SnackPosition.BOTTOM);
      Get.to(() => DashBoard());
    }
  }

  @override
  void dispose() {
    super.dispose();
    emailField.dispose();
    passwordField.dispose();
    phoneField.dispose();
  }
}
