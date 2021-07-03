import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:closho/constants/colors.dart';
import 'package:closho/constants/constVariables.dart';
import 'package:closho/controller/cartController.dart';
import 'package:closho/controller/controller.dart';
import 'package:closho/model/itemModel.dart';
import 'package:closho/widgets/cartButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemDetailsScreen extends StatelessWidget {
  ItemDetailsScreen({Key? key, required this.itemModel}) : super(key: key);
  final ItemModel itemModel;

  final CartController cartController = Get.put(CartController());
  final CarouselController carouselController = CarouselController();
  final Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: deviceHeight * 0.95,
            child: Stack(
              children: [
                CarouselSlider.builder(
                  itemCount: itemModel.imagePath.length,
                  carouselController: carouselController,
                  options: CarouselOptions(
                      height: deviceHeight * 0.95,
                      autoPlay: true,
                      onPageChanged: (index, reason) =>
                          controller.changeIndex(index)),
                  itemBuilder:
                      (BuildContext context, int index, int realIndex) {
                    return itemModel.isAsset!
                        ? Image.asset(
                            "${itemModel.imagePath[index]}",
                            fit: BoxFit.cover,
                          )
                        : Image.file(
                            File("${itemModel.imagePath[index]}"),
                            fit: BoxFit.cover,
                          );
                  },
                ),
                Positioned(
                  bottom: deviceHeight * 0.05,
                  left: 0.0,
                  right: 0.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: itemModel.imagePath.asMap().entries.map((entry) {
                      return Obx(
                        () => GestureDetector(
                          onTap: () =>
                              carouselController.animateToPage(entry.key),
                          child: Container(
                            width: 10.0,
                            height: 10.0,
                            margin: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 4.0),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: (customPink).withOpacity(
                                    controller.currentIndex.value == entry.key
                                        ? 1
                                        : 0.5)),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.20,
            minChildSize: 0.1,
            maxChildSize: 0.35,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                    color: customWhite,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30.0))),
                child: ListView(
                  controller: scrollController,
                  padding: EdgeInsets.all(8.0),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          itemModel.name,
                          style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Text(
                          "₹ ${itemModel.amount}",
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: customGrey),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Select Your Size: ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        if (itemModel.sizeList[0]) sizeContainer("S"),
                        if (itemModel.sizeList[1]) sizeContainer("M"),
                        if (itemModel.sizeList[2]) sizeContainer("L"),
                        if (itemModel.sizeList[3]) sizeContainer("XL"),
                      ],
                    ),
                    InkWell(
                      onTap: () => cartController.addTOCart(itemModel),
                      child: Container(
                        padding: EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                            color: customBlack,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0))),
                        child: Text(
                          "Add To Cart",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: customWhite, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Text("Details"),
                    Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
                        "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
                        "when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
                  ]
                      .map((e) => Padding(
                            padding: EdgeInsets.symmetric(vertical: 3.0),
                            child: e,
                          ))
                      .toList(),
                ),
              );
            },
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: Icon(Icons.arrow_back_ios_outlined),
                  ),
                  CartButton(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  InkWell sizeContainer(String text) {
    return InkWell(
      onTap: () => cartController.changeSize(text),
      child: Obx(
        () => Container(
          height: 23.0,
          width: 23.0,
          padding: EdgeInsets.all(4.0),
          margin: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
              color:
                  cartController.size.value == text ? customPink : customWhite,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 2,
                    offset: Offset(1, 1)),
              ],
              borderRadius: BorderRadius.all(Radius.circular(5.0))),
          child: FittedBox(child: Text(text)),
        ),
      ),
    );
  }
}
