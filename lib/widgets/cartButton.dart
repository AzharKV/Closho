import 'package:closho/controller/cartController.dart';
import 'package:closho/view/client/cartScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartButton extends StatelessWidget {
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => CartScreen()),
      child: Container(
        width: 35,
        height: 35,
        child: Stack(
          children: [
            Align(
                alignment: Alignment.bottomLeft,
                child: Icon(
                  Icons.shopping_cart,
                  size: 30,
                  color: Color(0xFF454242),
                )),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: EdgeInsets.all(2.0),
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    color: Color(0xFFf7dbe2), shape: BoxShape.circle),
                child: FittedBox(
                    child: Obx(
                        () => Text(cartController.cartLength.value.toString()))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
