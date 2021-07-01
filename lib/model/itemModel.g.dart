// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itemModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemModelAdapter extends TypeAdapter<ItemModel> {
  @override
  final int typeId = 0;

  @override
  ItemModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ItemModel(
      indexNo: fields[10] as int,
      id: fields[0] as int,
      name: fields[1] as String,
      amount: fields[2] as double?,
      imageUrl: (fields[3] as List).cast<String>(),
      sizeList: (fields[6] as List).cast<bool>(),
      colorList: (fields[7] as List).cast<String>(),
      haveOffer: fields[4] as bool?,
      offerPer: fields[5] as double?,
      dateTime: fields[8] as DateTime,
      category: fields[9] as String,
      gender: fields[11] as String,
      isAsset: fields[12] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, ItemModel obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.imageUrl)
      ..writeByte(4)
      ..write(obj.haveOffer)
      ..writeByte(5)
      ..write(obj.offerPer)
      ..writeByte(6)
      ..write(obj.sizeList)
      ..writeByte(7)
      ..write(obj.colorList)
      ..writeByte(8)
      ..write(obj.dateTime)
      ..writeByte(9)
      ..write(obj.category)
      ..writeByte(10)
      ..write(obj.indexNo)
      ..writeByte(11)
      ..write(obj.gender)
      ..writeByte(12)
      ..write(obj.isAsset);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
