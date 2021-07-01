import 'package:hive/hive.dart';
part 'cartModel.g.dart';

@HiveType(typeId: 1)
class CartModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final double? amount;
  @HiveField(3)
  final List<String> imageUrl;
  @HiveField(4)
  final String size;
  @HiveField(5)
  final String color;
  @HiveField(6)
  final DateTime dateTime;
  @HiveField(7)
  final String category;
  @HiveField(8)
  final int indexNo;
  @HiveField(9)
  final String gender;
  @HiveField(10)
  final bool? isAsset;

  CartModel({
    required this.indexNo,
    required this.id,
    required this.name,
    this.amount = 0.0,
    required this.size,
    required this.color,
    required this.imageUrl,
    required this.dateTime,
    required this.category,
    required this.gender,
    this.isAsset = false,
  });
}
