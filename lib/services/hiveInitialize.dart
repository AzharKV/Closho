import 'dart:io';
import 'package:closho/constants/strings.dart';
import 'package:closho/model/cartModel.dart';
import 'package:closho/model/itemModel.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

hiveInitializing() async {
  Directory directory = await getApplicationDocumentsDirectory();

  Hive.init(directory.path);

  //type adapter registration
  Hive.registerAdapter(ItemModelAdapter());
  Hive.registerAdapter(CartModelAdapter());


  //Open Hive box
  await Hive.openBox<ItemModel>(boxItem);
  await Hive.openBox<CartModel>(boxCart);
}
