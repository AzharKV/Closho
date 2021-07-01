import 'package:hive/hive.dart';
part 'itemModel.g.dart';

@HiveType(typeId: 0)
class ItemModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final double? amount;
  @HiveField(3)
  final List<String> imageUrl;
  @HiveField(4)
  final bool? haveOffer;
  @HiveField(5)
  final double? offerPer;
  @HiveField(6)
  final List<bool> sizeList;
  @HiveField(7)
  final List<String> colorList;
  @HiveField(8)
  final DateTime dateTime;
  @HiveField(9)
  final String category;
  @HiveField(10)
  final int indexNo;
  @HiveField(11)
  final String gender;
  @HiveField(12)
  final bool? isAsset;

  ItemModel({
    required this.indexNo,
    required this.id,
    required this.name,
    this.amount = 0.0,
    required this.imageUrl,
    required this.sizeList,
    required this.colorList,
    this.haveOffer = false,
    this.offerPer = 0.0,
    required this.dateTime,
    required this.category,
    required this.gender,
    this.isAsset = false,
  });
}
