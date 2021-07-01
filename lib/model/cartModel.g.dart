// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cartModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CartModelAdapter extends TypeAdapter<CartModel> {
  @override
  final int typeId = 1;

  @override
  CartModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CartModel(
      indexNo: fields[8] as int,
      id: fields[0] as int,
      name: fields[1] as String,
      amount: fields[2] as double?,
      size: fields[4] as String,
      color: fields[5] as String,
      imageUrl: (fields[3] as List).cast<String>(),
      dateTime: fields[6] as DateTime,
      category: fields[7] as String,
      gender: fields[9] as String,
      isAsset: fields[10] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, CartModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.imageUrl)
      ..writeByte(4)
      ..write(obj.size)
      ..writeByte(5)
      ..write(obj.color)
      ..writeByte(6)
      ..write(obj.dateTime)
      ..writeByte(7)
      ..write(obj.category)
      ..writeByte(8)
      ..write(obj.indexNo)
      ..writeByte(9)
      ..write(obj.gender)
      ..writeByte(10)
      ..write(obj.isAsset);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
