import 'dart:async';
import 'package:closho/constants/strings.dart';
import 'package:closho/model/itemModel.dart';
import 'package:closho/services/sharedPref.dart';
import 'package:closho/view/admin/dashBoard.dart';
import 'package:closho/widgets/customPaint/semiCirclePaint.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'client/home.dart';
import 'logIn/loginScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final Box<ItemModel> itemBox = Hive.box<ItemModel>(boxItem);
  @override
  void initState() {
    super.initState();

    onOpen();
  }

  void onOpen() {
    Timer(Duration(milliseconds: 800), () async {
      try {
        userSignedIn = await SharedPref().readInt(isUserSignIn);
      } catch (e) {
        print(e.toString());
      }

      //value 0 means, no one signed
      if (userSignedIn == 0)
        Get.off(() => LoginScreen(),
            duration: Duration(milliseconds: 700), transition: Transition.zoom);

      //value 1 means, client signed
      if (userSignedIn == 1)
        Get.off(() => Home(),
            duration: Duration(milliseconds: 700), transition: Transition.zoom);

      //value 0 means, admin signed
      if (userSignedIn == 2)
        Get.off(() => DashBoard(),
            duration: Duration(milliseconds: 700), transition: Transition.zoom);
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: semiCircle,
            child: CustomPaint(
              size: Size(width, (width * 1.9)),
              painter: SemiCirclePaint(),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Hero(tag: logo, child: Image.asset(logoPath)),
            ),
          ),
        ],
      ),
    );
  }
}
