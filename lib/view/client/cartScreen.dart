import 'dart:io';
import 'package:closho/constants/colors.dart';
import 'package:closho/controller/cartController.dart';
import 'package:closho/model/cartModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);

  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_outlined),
            onPressed: () => Get.back()),
        title: Text("Cart"),
        actions: [
          Row(
            children: [
              Obx(() => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      cartController.cartLength.value.toString(),
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: customGrey),
                    ),
                  )),
            ],
          )
        ],
        centerTitle: true,
        elevation: 2.0,
      ),
      body: Obx(
        () => Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartController.cartItems.length,
                itemBuilder: (BuildContext context, int index) {
                  CartModel data = cartController.cartItems[index];
                  return Card(
                    margin:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                    elevation: 3.0,
                    child: ListTile(
                      minVerticalPadding: 10.0,
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
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Size: ${data.size}"),
                          Text("Amount ₹:  ${data.amount}"),
                        ],
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => cartController.deleteCartItem(index),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                  color: customWhite,
                  boxShadow: [BoxShadow(color: customBlack, blurRadius: 3)],
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(25.0))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Items",
                        style: TextStyle(
                            color: customBlack,
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        cartController.cartLength.value.toString(),
                        style: TextStyle(
                            color: customGrey,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Amount",
                        style: TextStyle(
                            color: customBlack,
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        cartController.totalAmount.value.toString(),
                        style: TextStyle(
                            color: customGrey,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  InkWell(
                    child: Container(
                      padding: EdgeInsets.all(15.0),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: customBlack,
                          borderRadius:
                              BorderRadius.all(Radius.circular(30.0))),
                      child: Text(
                        "CheckOut",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: customWhite, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
