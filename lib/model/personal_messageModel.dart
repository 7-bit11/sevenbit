import 'package:json_annotation/json_annotation.dart';
part 'personal_messageModel.g.dart';

@JsonSerializable()
class MessageModel {
  MessageModel(
      this.id, this.account, this.imgurl, this.name, this.body, this.creTime);
  late String id;
  late String imgurl; //头像路径
  late String name; //名字
  late String body; //内容
  late String creTime; //创建时间
  late String account; //用户id

  /* 反序列化 */

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);

  /* 序列化 */
  Map<String, dynamic> toJson() => _$MessageModelToJson(this);
}
