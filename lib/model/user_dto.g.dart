// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDto _$UserDtoFromJson(Map<String, dynamic> json) => UserDto(
      json['name'] as String,
      json['headUrl'] as String,
      json['introduce'] as String,
      json['birthday'] as String,
      json['province'] as String,
      json['city'] as String,
      json['town'] as String,
      json['occupation'] as String,
      json['sex'] as String,
    );

Map<String, dynamic> _$UserDtoToJson(UserDto instance) => <String, dynamic>{
      'name': instance.name,
      'headUrl': instance.headUrl,
      'introduce': instance.introduce,
      'birthday': instance.birthday,
      'province': instance.province,
      'city': instance.city,
      'town': instance.town,
      'occupation': instance.occupation,
      'sex': instance.sex,
    };
