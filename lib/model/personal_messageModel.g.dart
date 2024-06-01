// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_messageModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageModel _$MessageModelFromJson(Map<String, dynamic> json) => MessageModel(
      json['id'] as String,
      json['account'] as String,
      json['imgurl'] as String,
      json['name'] as String,
      json['body'] as String,
      json['creTime'] as String,
    );

Map<String, dynamic> _$MessageModelToJson(MessageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imgurl': instance.imgurl,
      'name': instance.name,
      'body': instance.body,
      'creTime': instance.creTime,
      'account': instance.account,
    };
