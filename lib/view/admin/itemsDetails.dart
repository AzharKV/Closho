import 'dart:io';
import 'package:closho/constants/colors.dart';
import 'package:closho/constants/constVariables.dart';
import 'package:closho/constants/strings.dart';
import 'package:closho/controller/productController.dart';
import 'package:closho/widgets/formTextField.dart';
import 'package:closho/widgets/sizeContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ItemScreen extends StatelessWidget {
  ItemScreen({Key? key}) : super(key: key);

  final ProductController productController = Get.put(ProductController());

  final List<String> categoryList = [coats, dress, jersey, pants];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Product"),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: () => productController.save(),
              child: Text("Save", style: blackText))
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: productController.productForm,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FormTextField(
                controller: productController.name,
                textInputType: TextInputType.multiline,
                text: 'Name',
                validator: (value) {
                  if (value!.isEmpty) return "Field Mandatory";
                },
              ),
              FormTextField(
                controller: productController.amount,
                textInputType: const TextInputType.numberWithOptions(),
                text: 'Amount',
                validator: (value) {
                  if (value!.isEmpty) return "Field Mandatory";
                  if (!value.isCurrency) return "Enter Valid Number";
                },
              ),
              Row(
                children: [
                  Text("Have Offer"),
                  Obx(() => Checkbox(
                      onChanged: (bool? value) =>
                          productController.haveOffer.value = value!,
                      value: productController.haveOffer.value)),
                  Expanded(
                    child: Obx(
                      () => AnimatedOpacity(
                        opacity: productController.haveOffer.value ? 1 : 0,
                        duration: Duration(milliseconds: 300),
                        child: FormTextField(
                          controller: productController.percentage,
                          textInputType:
                              const TextInputType.numberWithOptions(),
                          text: 'Percentage',
                          validator: (value) {},
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text("Size:"),
                  Obx(() => SizeContainer(
                      text: 'S',
                      color: productController.sizeS.value
                          ? customPink
                          : customWhite,
                      onTap: () => productController.sizeS.value =
                          !productController.sizeS.value)),
                  Obx(() => SizeContainer(
                      text: 'M',
                      color: productController.sizeM.value
                          ? customPink
                          : customWhite,
                      onTap: () => productController.sizeM.value =
                          !productController.sizeM.value)),
                  Obx(() => SizeContainer(
                      text: 'L',
                      color: productController.sizeL.value
                          ? customPink
                          : customWhite,
                      onTap: () => productController.sizeL.value =
                          !productController.sizeL.value)),
                  Obx(() => SizeContainer(
                      text: 'XL',
                      color: productController.sizeXL.value
                          ? customPink
                          : customWhite,
                      onTap: () => productController.sizeXL.value =
                          !productController.sizeXL.value)),
                ]
                    .map((e) => Padding(
                        padding: const EdgeInsets.only(right: 5.0), child: e))
                    .toList(),
              ),
              Row(
                children: [
                  Text("Select Category: "),
                  SizedBox(width: 10.0),
                  Obx(() => DropdownButton(
                        value: productController.selectedCategory.value,
                        items:
                            categoryList.map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(color: Colors.black),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) => productController
                            .selectedCategory.value = value.toString(),
                        hint: Text("Category"),
                        underline: SizedBox(),
                      )),
                ],
              ),
              TextButton(
                child: Text("Pick Product Images"),
                onPressed: () async {
                  PickedFile? imagePicked =
                      await ImagePicker().getImage(source: ImageSource.gallery);
                  if (imagePicked != null)
                    productController.imagePath.insert(0, imagePicked.path);
                },
              ),
              Obx(
                () => GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.5,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10),
                  itemCount: productController.imagePath.length,
                  itemBuilder: (BuildContext context, int index) => Image.file(
                    File(productController.imagePath[index]),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ]
                .map((e) => Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 5.0),
                    child: e))
                .toList(),
          ),
        ),
      ),
    );
  }
}
