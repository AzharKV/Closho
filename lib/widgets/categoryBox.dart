import 'package:closho/constants/colors.dart';
import 'package:closho/controller/homeController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryBox extends StatelessWidget {
  CategoryBox({
    Key? key,
    required this.categoryName,
  }) : super(key: key);

  final String categoryName;
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => homeController.changeCategory(categoryName),
      splashFactory: NoSplash.splashFactory,
      child: Obx(
        () => Container(
          child: Text(categoryName, textAlign: TextAlign.center),
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          decoration: BoxDecoration(
              color: homeController.selectCategory.value == categoryName
                  ? customPink
                  : Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(30.0))),
        ),
      ),
    );
  }
}
