import 'dart:io';
import 'package:closho/constants/colors.dart';
import 'package:closho/constants/constVariables.dart';
import 'package:closho/constants/strings.dart';
import 'package:closho/controller/homeController.dart';
import 'package:closho/model/itemModel.dart';
import 'package:closho/widgets/cartButton.dart';
import 'package:closho/widgets/categoryBox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import 'itemDetailsScreen.dart';

class Home extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Get.dialog(
                        AlertDialog(
                          contentPadding: EdgeInsets.all(5.0),
                          content: ListTile(
                            onTap: () => homeController.signOut(),
                            title: Text("Sign Out"),
                            trailing: Icon(Icons.logout),
                          ),
                        ),
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Image.asset(
                            profilePlaceHolder,
                            fit: BoxFit.cover,
                            width: 40.0,
                            height: 40.0,
                          )),
                    ),
                    CartButton()
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: CategoryBox(categoryName: coats)),
                    Expanded(child: CategoryBox(categoryName: dress)),
                    Expanded(child: CategoryBox(categoryName: jersey)),
                    Expanded(child: CategoryBox(categoryName: pants)),
                  ],
                ),
              ]
                  .map((e) => Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                      child: e))
                  .toList(),
            ),
            Container(
              height: deviceHeight / 2.2,
              child: Obx(
                () => homeController.recommendItemList.length == 0
                    ? Center(
                        child: Text("No Products",
                            style: TextStyle(
                                fontSize: 16,
                                color: customGrey,
                                fontWeight: FontWeight.bold)))
                    : ListView.separated(
                        padding: const EdgeInsets.all(16.0),
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        itemCount: homeController.recommendItemList.length,
                        itemBuilder: (BuildContext context, int index) {
                          ItemModel data =
                              homeController.recommendItemList[index];
                          return Container(
                            width: deviceWidth / 1.8,
                            child: dataDisplayWidget(data),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            SizedBox(width: 16.0),
                      ),
              ),
            ),
            Obx(
              () => homeController.recommendItemList.length == 0
                  ? Center(
                      child: Text("No Products",
                          style: TextStyle(
                              fontSize: 16,
                              color: customGrey,
                              fontWeight: FontWeight.bold)))
                  : GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: 0.6),
                      itemCount: homeController.itemList.length,
                      itemBuilder: (BuildContext context, int index) {
                        ItemModel data = homeController.itemList[index];
                        return Padding(
                          padding: EdgeInsets.all(8.0),
                          child: dataDisplayWidget(data),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  InkWell dataDisplayWidget(ItemModel data) => InkWell(
        onTap: () => Get.to(
          () => ItemDetailsScreen(itemModel: data),
          transition: Transition.downToUp,
          duration: Duration(milliseconds: 500),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: data.isAsset!
                        ? Image.asset(
                            "${data.imagePath[0]}",
                            fit: BoxFit.fill,
                          )
                        : Image.file(
                            File("${data.imagePath[0]}"),
                            fit: BoxFit.fill,
                          ),
                  ),
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    titleText(data.name),
                    amountText(data.amount.toString())
                  ],
                )
              ],
            ),
            if (data.haveOffer!)
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  width: 40.0,
                  height: 25.0,
                  padding: EdgeInsets.all(4.0),
                  margin: EdgeInsets.only(top: 5.0, left: 5.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.black),
                  child: FittedBox(
                    child: Text(
                      "- ${data.offerPer!.toStringAsFixed(0)} %",
                      style: TextStyle(color: customWhite),
                    ),
                  ),
                ),
              ),
          ],
        ),
      );

  Expanded titleText(String text) => Expanded(
      child: Text(text,
          style: TextStyle(color: customBlack, fontWeight: FontWeight.bold)));
  Expanded amountText(String text) => Expanded(
      child: Text(text,
          style: TextStyle(
              fontSize: 13, color: customGrey, fontWeight: FontWeight.bold),
          textAlign: TextAlign.end));
}
