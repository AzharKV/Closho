import 'package:closho/constants/strings.dart';
import 'package:closho/model/cartModel.dart';
import 'package:closho/model/itemModel.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class CartController extends GetxController {
  final Box<CartModel> cartBox = Hive.box<CartModel>(boxCart);

  RxList cartItems = [].obs;
  RxInt cartLength = 0.obs;
  RxString size = ''.obs;
  RxString color = ''.obs;
  RxDouble totalAmount = 0.0.obs;

  @override
  void onInit() {
    super.onInit();

    getCartLength();
    fetchCartList();
  }

  Future<bool> addTOCart(ItemModel data) async {
    bool isSuccess = false;
    DateTime dateTime = DateTime.now();

    CartModel cartModel = CartModel(
        indexNo: cartBox.length,
        id: dateTime.millisecondsSinceEpoch,
        name: data.name,
        size: size.value,
        amount: data.amount,
        isAsset: data.isAsset,
        color: color.value,
        imageUrl: data.imageUrl,
        dateTime: dateTime,
        category: data.category,
        gender: data.gender);

    if (size.isNotEmpty) {
      await cartBox.add(cartModel).whenComplete(() {
        Get.snackbar("", "Added To Cart", snackPosition: SnackPosition.BOTTOM);
        getCartLength();
        fetchCartList();
        isSuccess = true;
      }).catchError((onError) {
        isSuccess = false;
        print(onError);
      });
    } else {
      Get.snackbar("", "Please Select Your Size",
          snackPosition: SnackPosition.BOTTOM);
    }

    return isSuccess;
  }

  void fetchCartList() {
    List<CartModel> list = cartBox.values.toList();
    cartItems.value = list;
    totalAmount.value = 0;
    list.forEach((element) => totalAmount.value += element.amount ?? 0.0);
  }

  void changeSize(String sizeString) => size.value = sizeString;

  void changeColor(String colorString) => color.value = colorString;

  void getCartLength() => cartLength.value = cartBox.length;

  void deleteCartItem(int id) {
    cartBox.deleteAt(id);
    getCartLength();
    fetchCartList();
  }
}
