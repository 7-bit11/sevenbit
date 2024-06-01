class DynamicModel {
  DynamicModel(this.imgdata, this.tilteName, this.createtime, this.eyenumber,
      this.commentnumber, this.address);
  late List<String> imgdata; //图片数组
  late String tilteName; //标题名
  late String createtime; //发布时间
  late String address; //地址
  late int eyenumber; //查看人数
  late int commentnumber; //评论人数
}
