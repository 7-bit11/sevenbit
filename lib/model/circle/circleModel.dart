import 'package:flutter/material.dart';

List<CircleModel> getCircleModelList() {
  List<CircleModel> modelList = [
    CircleModel(
        "assets/images/85861268_p0.jpg",
        "动漫爱好者",
        false,
        "https://w.wallhaven.cc/full/m3/wallhaven-m3lkj1.jpg",
        "12:59",
        "Stable Diffusion AI绘画",
        1443,
        DateTime(2023, 2, 24),
        "成都",
        848,
        2003),
    CircleModel(
        "assets/images/my.jpg",
        "花开富贵",
        true,
        "https://w.wallhaven.cc/full/p9/wallhaven-p9od6j.jpg",
        "12:59",
        "Stable Diffusion AI绘画",
        1443,
        DateTime(2023, 2, 24),
        "成都",
        848,
        2003),
    CircleModel(
        "assets/images/lbl.jpg",
        "真正的ikun",
        true,
        "https://w.wallhaven.cc/full/qz/wallhaven-qzryz7.png",
        "12:59",
        "Stable Diffusion AI绘画",
        1443,
        DateTime(2023, 2, 24),
        "成都",
        848,
        2003),
    CircleModel(
        "assets/images/67341501_p0.jpg",
        "我是超人强",
        false,
        "https://w.wallhaven.cc/full/ex/wallhaven-ex8mkw.jpg",
        "12:59",
        "Stable Diffusion AI绘画",
        1443,
        DateTime(2023, 2, 24),
        "成都",
        848,
        2003)
  ];
  return modelList;
}

class CircleModel {
  late String userImg; //用户头像
  late String userName; //用户名称
  late bool attention; //是否关注
  late String videoImg; //视频封面
  late String? videoUrl; //视频路径
  late String videoTime; //视频时长
  late int lookNumber; //观看数量
  late String videoTitle; //视频标题
  late DateTime createTime; //发布日期
  late String address; //发布地址
  late int commentNumber; //评论数
  late int giveUpNumber; //点赞数
  CircleModel(
      this.userImg,
      this.userName,
      this.attention,
      this.videoImg,
      this.videoTime,
      this.videoTitle,
      this.lookNumber,
      this.createTime,
      this.address,
      this.commentNumber,
      this.giveUpNumber,
      {this.videoUrl});
}
