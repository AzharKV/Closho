import 'package:closho/constants/colors.dart';
import 'package:closho/constants/constVariables.dart';
import 'package:closho/constants/strings.dart';
import 'package:closho/controller/loginController.dart';
import 'package:closho/widgets/constWidgets.dart';
import 'package:closho/widgets/customPaint/semiCirclePaint.dart';
import 'package:closho/widgets/registrationTextField.dart';
import 'package:closho/widgets/signUpWith.dart';
import 'package:closho/widgets/textRightIconButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'loginScreen.dart';

class RegistrationScreen extends StatelessWidget {
  final LoginController logInController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: semiCircle,
            child: CustomPaint(
              size: Size(deviceWidth, (deviceWidth * 1.9)),
              painter: SemiCirclePaint(),
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: TextRightIconButton(
                      text: "Already Have Account",
                      onPress: () => Get.off(
                            () => LoginScreen(),
                            transition: Transition.rightToLeft,
                            duration: Duration(milliseconds: 500),
                          )),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Hero(
                    tag: logo,
                    child: Image.asset(logoPath, width: deviceWidth / 1.6),
                  ),
                ),
                sizedBox15,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Form(
                    key: logInController.registerFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "New User",
                          style: TextStyle(
                              color: Color(0xff928e8e),
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        RegistrationTextField(
                            controller: logInController.emailField,
                            hintText: "Email Address",
                            iconData: Icons.alternate_email,
                            textInputType: TextInputType.emailAddress,
                            validator: (value) =>
                                logInController.emailValidation(value)),
                        RegistrationTextField(
                            controller: logInController.phoneField,
                            hintText: "Phone Number",
                            iconData: Icons.phone_android,
                            textInputType: TextInputType.numberWithOptions(
                                signed: false, decimal: false),
                            validator: (value) =>
                                logInController.phoneValidation(value)),
                        RegistrationTextField(
                            controller: logInController.passwordField,
                            hintText: "Password",
                            iconData: Icons.lock,
                            textInputType: TextInputType.visiblePassword,
                            validator: (value) =>
                                logInController.passwordValidation(value)),
                        Align(
                          alignment: Alignment.centerRight,
                          child: MaterialButton(
                            onPressed: () => logInController.registration(),
                            padding: EdgeInsets.symmetric(horizontal: 30.0),
                            child: Text("Create Account",
                                style: TextStyle(
                                    color: customWhite,
                                    fontWeight: FontWeight.bold)),
                            color: Color(0xff41b8e5),
                            shape: StadiumBorder(),
                          ),
                        )
                      ]
                          .map((e) => Padding(
                              padding: EdgeInsets.symmetric(vertical: 5.0),
                              child: e))
                          .toList(),
                    ),
                  ),
                ),
                SizedBox(height: 50.0),
                SignUpWith(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
