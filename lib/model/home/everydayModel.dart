class EverydayModel {
  EverydayModel(this.imgUrl, this.title, this.lookNumber, this.stareNumber,
      this.videoTime, this.personNumber,
      {this.videoUrl});
  late String imgUrl;
  late String? videoUrl;
  late String videoTime;
  late int lookNumber;
  late int stareNumber;
  late int personNumber;
  late String title;
}
