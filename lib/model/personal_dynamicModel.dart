import 'package:json_annotation/json_annotation.dart';
part 'personal_dynamicModel.g.dart';

@JsonSerializable()
class DynamicModel {
  DynamicModel(this.id, this.imgdata, this.tilteName, this.createtime,
      this.eyenumber, this.commentnumber, this.address); //
  late String id;
  late List<String> imgdata; //图片数组
  late String tilteName; //标题名
  late String createtime; //发布时间
  late String address; //地址
  late int eyenumber; //查看人数
  late int commentnumber; //评论人数

  /* 反序列化 */

  factory DynamicModel.fromJson(Map<String, dynamic> json) =>
      _$DynamicModelFromJson(json);

  /* 序列化 */
  Map<String, dynamic> toJson() => _$DynamicModelToJson(this);
}
