import 'package:flutter/material.dart';
import 'colors.dart';

ThemeData lightTheme = ThemeData(
  primaryTextTheme: Typography.material2018().black,
  backgroundColor: customWhite,
  scaffoldBackgroundColor: customWhite,
  appBarTheme: AppBarTheme(
    backgroundColor: customWhite,
    elevation: 0.0,
    iconTheme: IconThemeData(color: customBlack),
  ),
);

ThemeData darkTheme = ThemeData(
  primaryTextTheme: Typography.material2018().white,
  backgroundColor: customBlack,
  scaffoldBackgroundColor: customBlack,
  appBarTheme: AppBarTheme(
    backgroundColor: customBlack,
    elevation: 0.0,
  ),
);
