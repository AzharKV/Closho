import 'package:get/get.dart';

class Controller extends GetxController {
  RxInt currentIndex = 0.obs;

  void changeIndex(int index) => currentIndex.value = index;
}
