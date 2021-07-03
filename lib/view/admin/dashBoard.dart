import 'dart:io';
import 'package:closho/constants/colors.dart';
import 'package:closho/constants/strings.dart';
import 'package:closho/controller/cartController.dart';
import 'package:closho/controller/homeController.dart';
import 'package:closho/model/itemModel.dart';
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
        onPressed: () {},
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
              Sections(
                  title: "Total Products",
                  count: homeController.totalProducts().toString()),
              Obx(() => Sections(
                  title: "Total In Users Cart",
                  count: cartController.cartLength.toString())),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 7),
              child: ListView.builder(
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
                                  "${data.imageUrl[0]}",
                                  fit: BoxFit.cover,
                                  height: 50.0,
                                  width: 50.0,
                                )
                              : Image.file(
                                  File("${data.imageUrl[0]}"),
                                  fit: BoxFit.fill,
                                ),
                        ),
                        title: Text(data.name),
                        trailing: Text("${data.amount} ₹")),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Sections extends StatelessWidget {
  final String title;
  final String count;

  const Sections({Key? key, required this.title, required this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.teal.withOpacity(0.5),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: customWhite, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text(
            count,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: customWhite, fontWeight: FontWeight.bold, fontSize: 40),
          ),
        ],
      ),
    );
  }
}
