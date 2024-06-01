// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_dynamicModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DynamicModel _$DynamicModelFromJson(Map<String, dynamic> json) => DynamicModel(
      json['id'] as String,
      (json['imgdata'] as List<dynamic>).map((e) => e as String).toList(),
      json['tilteName'] as String,
      json['createtime'] as String,
      json['eyenumber'] as int,
      json['commentnumber'] as int,
      json['address'] as String,
    );

Map<String, dynamic> _$DynamicModelToJson(DynamicModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imgdata': instance.imgdata,
      'tilteName': instance.tilteName,
      'createtime': instance.createtime,
      'address': instance.address,
      'eyenumber': instance.eyenumber,
      'commentnumber': instance.commentnumber,
    };
