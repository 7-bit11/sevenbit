// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_collectionModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionModel _$CollectionModelFromJson(Map<String, dynamic> json) =>
    CollectionModel(
      json['id'] as String,
      json['createTime'] as String,
      json['tilteName'] as String,
      json['videoTime'] as String,
      json['tilteImgUrl'] as String,
    );

Map<String, dynamic> _$CollectionModelToJson(CollectionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createTime': instance.createTime,
      'tilteName': instance.tilteName,
      'videoTime': instance.videoTime,
      'tilteImgUrl': instance.tilteImgUrl,
    };
