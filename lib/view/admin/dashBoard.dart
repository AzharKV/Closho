import 'dart:io';
import 'package:closho/constants/strings.dart';
import 'package:closho/controller/cartController.dart';
import 'package:closho/controller/homeController.dart';
import 'package:closho/model/itemModel.dart';
import 'package:closho/view/admin/itemsDetails.dart';
import 'package:closho/widgets/gridViewSections.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashBoard extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 8.0),
          child: GestureDetector(
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
        ),
        title: Text("DashBoard"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Get.to(() => ItemScreen(),
            duration: Duration(milliseconds: 700),
            transition: Transition.downToUp),
        shape: StadiumBorder(),
        label: Text("Add New Product"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Column(
        children: [
          GridView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            children: [
              GridViewSections(
                  title: "Total Products",
                  count: homeController.totalProducts().toString()),
              Obx(() => GridViewSections(
                  title: "Total In Users Cart",
                  count: cartController.cartLength.toString())),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 7),
              child: Obx(
                () => ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: homeController.totalList.length,
                  itemBuilder: (BuildContext context, int index) {
                    ItemModel data = homeController.totalList[index];
                    return Card(
                      margin:
                          EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                      elevation: 3.0,
                      child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(50.0),
                            child: data.isAsset!
                                ? Image.asset(
                                    "${data.imagePath[0]}",
                                    fit: BoxFit.cover,
                                    height: 50.0,
                                    width: 50.0,
                                  )
                                : Image.file(
                                    File("${data.imagePath[0]}"),
                                    fit: BoxFit.cover,
                                    height: 50.0,
                                    width: 50.0,
                                  ),
                          ),
                          title: Text(data.name),
                          trailing: Text("${data.amount} ₹")),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
