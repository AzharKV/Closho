import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'colors.dart';

double deviceWidth = Get.width;
double deviceHeight = Get.height;

const BorderRadius borderRadius10 = BorderRadius.all(Radius.circular(10.0));

const OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: borderRadius10,
    borderSide:
        BorderSide(color: customBlack, width: 0.5, style: BorderStyle.solid));

const OutlineInputBorder outlineInputErrorBorder = OutlineInputBorder(
    borderRadius: borderRadius10,
    borderSide: const BorderSide(
        color: Colors.red, width: 0.5, style: BorderStyle.solid));

const TextStyle blackText = TextStyle(color: customBlack);
