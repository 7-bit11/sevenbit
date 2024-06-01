import 'package:json_annotation/json_annotation.dart';
part 'user_dto.g.dart';

@JsonSerializable()
class UserDto {
  UserDto(this.name, this.headUrl, this.introduce, this.birthday, this.province,
      this.city, this.town, this.occupation, this.sex);
  late String name;
  late String headUrl;
  late String introduce;
  late String birthday;
  late String province;
  late String city;
  late String town;
  late String occupation;
  late String sex;
  /* 反序列化 */

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  /* 序列化 */
  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}
