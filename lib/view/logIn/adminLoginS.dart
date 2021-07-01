import 'package:closho/constants/colors.dart';
import 'package:closho/constants/constVariables.dart';
import 'package:closho/constants/strings.dart';
import 'package:closho/controller/loginController.dart';
import 'package:closho/widgets/constWidgets.dart';
import 'package:closho/widgets/customPaint/semiCirclePaint.dart';
import 'package:closho/widgets/registrationTextField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'loginScreen.dart';

class AdminLoginScreen extends StatelessWidget {
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                  tag: logo,
                  child: Image.asset(logoPath, width: deviceWidth / 1.6)),
              sizedBox15,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Form(
                  key: logInController.adminLoginFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Admin Sign In",
                        style: TextStyle(
                            color: Color(0xff928e8e),
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      RegistrationTextField(
                          controller: logInController.emailField,
                          hintText: "Email Address",
                          iconData: Icons.person_pin,
                          textInputType: TextInputType.emailAddress,
                          validator: (value) =>
                              logInController.emailValidation(value)),
                      RegistrationTextField(
                          controller: logInController.passwordField,
                          hintText: "Password",
                          iconData: Icons.lock,
                          textInputType: TextInputType.visiblePassword,
                          validator: (value) =>
                              logInController.passwordValidation(value)),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: MaterialButton(
                          onPressed: () => logInController.adminLogin(),
                          padding: EdgeInsets.symmetric(horizontal: 30.0),
                          child: Text("Sign In",
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
            ],
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: TextButton(
              onPressed: () => Get.off(
                () => LoginScreen(),
                transition: Transition.downToUp,
                duration: Duration(milliseconds: 500),
              ),
              child: Text(
                "Client Login",
                style: TextStyle(fontSize: 12.0, color: Colors.black54),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
