import 'package:json_annotation/json_annotation.dart';
part 'personal_collectionModel.g.dart';

@JsonSerializable()
class CollectionModel {
  CollectionModel(this.id, this.createTime, this.tilteName, this.videoTime,
      this.tilteImgUrl);
  late String id;
  late String createTime; //创建日期
  late String tilteName; //标题名称
  late String videoTime; //视频时长
  late String tilteImgUrl; //头像路径

  /* 反序列化 */

  factory CollectionModel.fromJson(Map<String, dynamic> json) =>
      _$CollectionModelFromJson(json);

  /* 序列化 */
  Map<String, dynamic> toJson() => _$CollectionModelToJson(this);
}
