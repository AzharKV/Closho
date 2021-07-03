import 'package:closho/constants/strings.dart';
import 'package:closho/model/itemModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'homeController.dart';

class ProductController extends GetxController {
  final Box<ItemModel> itemBox = Hive.box<ItemModel>(boxItem);

  final HomeController homeController = Get.put(HomeController());

  final GlobalKey<FormState> productForm = GlobalKey();

  final TextEditingController name = TextEditingController();
  final TextEditingController amount = TextEditingController();
  final TextEditingController percentage = TextEditingController();

  RxBool haveOffer = true.obs;
  RxBool sizeS = true.obs;
  RxBool sizeM = true.obs;
  RxBool sizeL = true.obs;
  RxBool sizeXL = false.obs;

  RxList imagePath = [].obs;

  RxString selectedCategory = dress.obs;

  Future<void> save() async {
    if (productForm.currentState!.validate()) {
      if (!sizeM.value && !sizeS.value && !sizeL.value && !sizeXL.value) {
        Get.snackbar("", "Please Select One Size",
            snackPosition: SnackPosition.BOTTOM);
      } else if (imagePath.length == 0) {
        Get.snackbar("", "Minimum Of One Photo Required",
            snackPosition: SnackPosition.BOTTOM);
      } else {
        ItemModel itemModel = ItemModel(
            id: DateTime.now().microsecondsSinceEpoch,
            name: name.text,
            amount: double.parse(amount.text),
            imagePath: imagePath.cast<String>(),
            sizeList: [sizeS.value, sizeM.value, sizeL.value, sizeXL.value],
            colorList: [],
            haveOffer: haveOffer.value,
            offerPer:
                percentage.text.isEmpty ? 0.0 : double.parse(percentage.text),
            dateTime: DateTime.now(),
            indexNo: 0,
            category: selectedCategory.value,
            gender: kid,
            isAsset: false);

        await itemBox.add(itemModel).whenComplete(() {
          homeController.totalList.insert(0, itemModel);
          Get.back();
          Get.snackbar("", "${name.text} Created Successfully",
              snackPosition: SnackPosition.BOTTOM);
        });
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    name.dispose();
  }
}
