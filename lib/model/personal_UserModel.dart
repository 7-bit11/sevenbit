import 'package:json_annotation/json_annotation.dart';

class User {
  User(
      this.userImgUrl,
      this.id,
      this.userName,
      this.userSex,
      this.birthday,
      this.province,
      this.city,
      this.town,
      this.occupation,
      this.account,
      this.fwiNumber,
      this.groupNumber,
      this.introduce,
      this.vmfbsNumber);
  late String userImgUrl; //头像
  late String userName; //名称
  late String userSex; //性别
  late DateTime birthday; //生日
  late String province; //省份
  late String city; //城市
  late String town; //区域
  late String occupation; //职业
  late String introduce; //个人介绍
  late String account;
  late int id;
  late int vmfbsNumber; //粉丝数
  late int fwiNumber; //关注数
  late int groupNumber; //群组数
  factory User.fromJson(Map<String, dynamic> parsedJson) {
    return User(
      parsedJson['headUrl'],
      parsedJson['id'],
      parsedJson['name'],
      parsedJson['sex'],
      DateTime.parse(parsedJson['birthday']),
      parsedJson['province'],
      parsedJson['city'],
      parsedJson['town'],
      parsedJson['occupation'],
      parsedJson['account'],
      parsedJson['fwiNumber'],
      parsedJson['groupNumber'],
      parsedJson['introduce'],
      parsedJson['vmfbsNumber'],
    );
  }
}
