import 'package:closho/constants/constVariables.dart';
import 'package:closho/constants/strings.dart';
import 'package:flutter/material.dart';

class SignUpWith extends StatelessWidget {
  const SignUpWith({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Sign up With"),
        SizedBox(height: 30.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: deviceWidth / 2.5,
              padding: EdgeInsets.symmetric(vertical: 8.0),
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.facebook, color: Colors.blue),
                  SizedBox(width: 10),
                  Text("facebook"),
                ],
              ),
            ),
            Container(
              width: deviceWidth / 2.5,
              padding: EdgeInsets.symmetric(vertical: 8.0),
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(googleLogo, height: 23),
                  SizedBox(width: 10),
                  Text("Google"),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
