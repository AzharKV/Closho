import 'package:closho/services/hiveInitialize.dart';
import 'package:closho/view/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'constants/colors.dart';
import 'constants/strings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await hiveInitializing();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: ThemeData(
          primaryTextTheme: Typography.material2018().black,
          backgroundColor: customWhite,
          scaffoldBackgroundColor: customWhite,
          appBarTheme: AppBarTheme(
              backgroundColor: customWhite,
              elevation: 0.0,
              iconTheme: IconThemeData(color: customBlack))),
      darkTheme: ThemeData(
        primaryTextTheme: Typography.material2018().white,
        backgroundColor: customBlack,
        scaffoldBackgroundColor: customBlack,
        appBarTheme: AppBarTheme(backgroundColor: customBlack, elevation: 0.0),
      ),
      themeMode: ThemeMode.light,
      home: SplashScreen(),
    );
  }
}
