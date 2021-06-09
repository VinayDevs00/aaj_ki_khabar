// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'postcontroller_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PostControllerHiveModelAdapter
    extends TypeAdapter<PostControllerHiveModel> {
  @override
  final int typeId = 0;

  @override
  PostControllerHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PostControllerHiveModel(
      (fields[0] as List)?.cast<PostsModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, PostControllerHiveModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.postsHive);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostControllerHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
