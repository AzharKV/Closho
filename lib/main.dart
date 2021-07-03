import 'package:closho/constants/theme.dart';
import 'package:closho/services/hiveInitialize.dart';
import 'package:closho/view/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      home: SplashScreen(),
    );
  }
}
