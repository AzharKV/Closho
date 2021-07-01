import 'dart:math';
import 'package:closho/constants/dummyItems.dart';
import 'package:closho/constants/strings.dart';
import 'package:closho/model/itemModel.dart';
import 'package:closho/services/sharedPref.dart';
import 'package:closho/view/logIn/loginScreen.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class HomeController extends GetxController {
  final Box<ItemModel> itemBox = Hive.box<ItemModel>(boxItem);

  RxString selectCategory = coats.obs;
  RxList recommendItemList = [].obs;
  RxList itemList = [].obs;
  RxList totalList = [].obs;

  @override
  void onInit() {
    super.onInit();
    fetch(selectCategory.value);
  }

  int individualCount(String category) {
    List<ItemModel> newList = [...itemBox.values, ...dummyItems];
    List<ItemModel> dressList =
        newList.where((element) => element.category == category).toList();

    return dressList.length;
  }

  int totalProducts() {
    List<ItemModel> newList = [...itemBox.values, ...dummyItems];

    return newList.length;
  }

  void fetch(String categoryName) {
    //get category matching items
    List<ItemModel> newProducts = itemBox.values
        .where((element) => element.category == categoryName)
        .toList();

    //get category matching have offer items
    List<ItemModel> recommendList = itemBox.values
        .where(
            (element) => element.category == categoryName && element.haveOffer!)
        .toList();

    //get dummy items
    List<ItemModel> dummyNewProducts = dummyItems
        .where((element) => element.category == categoryName)
        .toList();

    //get dummy offer items
    List<ItemModel> dummyRecommendList = dummyItems
        .where(
            (element) => element.category == categoryName && element.haveOffer!)
        .toList();

    //merge dummy and item list into one and shuffle
    List<ItemModel> newRecList = [...recommendList, ...dummyRecommendList];
    newRecList.shuffle(Random());

    //limit recommend list items to 10
    if (newRecList.length > 9) newRecList.removeRange(9, newRecList.length - 1);

    List<ItemModel> newList = [...newProducts, ...dummyNewProducts];
    newList.shuffle(Random());

    //add new list to observe list
    recommendItemList.value = newRecList;
    itemList.value = newList;

    List<ItemModel> fullList = [...itemBox.values, ...dummyItems];
    fullList.shuffle(Random());
    totalList.value = fullList;
  }

  void changeCategory(String newCategory) {
    selectCategory.value = newCategory;
    fetch(newCategory);
  }

  Future<void> signOut() async {
    await SharedPref().saveInt(isUserSignIn, 0);
    userSignedIn = 0;
    Get.snackbar("Thank Your For Your Time", "",
        snackPosition: SnackPosition.BOTTOM);
    Get.to(() => LoginScreen());
  }
}
