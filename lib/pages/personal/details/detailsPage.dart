import 'package:sevenbit/model/personal_UserModel.dart';
import 'package:sevenbit/pages/personal/details/detailsPageController.dart';
import 'package:sevenbit/utils/service_result.dart';
import 'package:sevenbit/widget/personal/details/detailsWidget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_pickers/pickers.dart';
import 'package:flutter_pickers/style/picker_style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sevenbit/utils/netUrl.dart';
import 'package:image_picker/image_picker.dart';
import '../../../utils/overall_situation.dart';

class DetailsPage extends GetView<DetailsPageController> {
  const DetailsPage(this.user, {super.key});
  final User user;

  @override
  Widget build(BuildContext context) {
    Get.put(DetailsPageController(user));
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(0, 255, 255, 255),
        leading: IconButton(
          icon: SvgPicture.asset("assets/svg/chevron-left.svg"),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text(
          "个人资料",
          style: TextStyle(color: Color.fromARGB(197, 0, 0, 0)),
        ),
        centerTitle: true,
      ),
      body: ListView(
        physics: const AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          DetailsWidget(
              GestureDetector(
                  onTap: () {
                    //_picker.pickImage(source: ImageSource.gallery); //打开相册
                    myshowModalBottomSheet(context, controller.picker);
                  },
                  child: Obx(
                    () => Hero(
                        tag: controller.xgimg.value
                            ? "${netUrl.bitnetUrl}getImg/${controller.user.userImgUrl}"
                            : "${netUrl.bitnetUrl}getImg/${controller.user.userImgUrl}",
                        child: ClipOval(
                          child: CachedNetworkImage(
                              imageUrl:
                                  "${netUrl.bitnetUrl}getImg/${controller.user.userImgUrl}",
                              fit: BoxFit.cover,
                              width: 50,
                              height: 50,
                              httpHeaders: ServiceTokenHead.headMap,
                              errorWidget: (context, url, error) {
                                return Image.asset(
                                  "assets/images/yt.jpg",
                                  fit: BoxFit.cover,
                                  width: 50,
                                  height: 50,
                                );
                              }),
                        )),
                  )),
              "头像",
              () {}),
          Obx(() => DetailsWidget(
                  getRightWidgetXX(controller.xgname.value
                      ? controller.user.userName
                      : controller.user.userName),
                  "昵称", () {
                Pickers.showSinglePicker(context,
                    data: ["7_bit", "seven_bit"],
                    selectData: controller.user.userName,
                    onConfirm: (p, position) {
                  controller.xgname.value = !controller.xgname.value;
                  controller.user.userName = p;
                });
              })),
          Obx(() => DetailsWidget(
                  getRightWidgetXX(controller.xgsex.value
                      ? controller.user.userSex
                      : controller.user.userSex),
                  "性别", () {
                Pickers.showSinglePicker(context,
                    pickerStyle: PickerStyle(textSize: 18),
                    data: ["男", "女"],
                    selectData: controller.user.userSex,
                    onConfirm: (p, position) {
                  controller.xgsex.value = !controller.xgsex.value;
                  controller.user.userSex = p;
                });
              })),
          Obx(() => DetailsWidget(
                  getRightWidgetXX(controller.getCurrentTime(
                      controller.xgbirthday.value
                          ? controller.user.birthday
                          : controller.user.birthday)),
                  "生日", () {
                DatePicker.showDatePicker(context,
                    showTitleActions: true,
                    minTime: DateTime(1899, 1, 1),
                    maxTime: DateTime(2077, 12, 12),
                    onChanged: (date) {}, onConfirm: (date) {
                  controller.user.birthday = date;
                  controller.xgbirthday.value = !controller.xgbirthday.value;
                },
                    currentTime: controller.user.birthday,
                    locale: LocaleType.zh);
              })),
          Obx(() => DetailsWidget(
                  getRightWidgetXX(controller.xgAddress.value
                      ? "${controller.user.province}-${controller.user.city}-${controller.user.town}"
                      : "${controller.user.province}-${controller.user.city}-${controller.user.town}"),
                  "住址", () {
                Pickers.showAddressPicker(
                  context,
                  addAllItem: false,
                  initProvince: controller.user.province,
                  initCity: controller.user.city,
                  initTown: controller.user.town,
                  onConfirm: (p, c, x) {
                    controller.user.province = p;
                    controller.user.city = c;
                    controller.user.town = x!;
                    controller.xgAddress.value = !controller.xgAddress.value;
                  },
                );
              })),
          DetailsWidget(
              getRightWidgetXX(controller.user.occupation), "职业", () {}),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: GradientButton(
                disabledColor: Colors.red,
                colors: const [
                  Color.fromARGB(14, 207, 204, 204),
                  Color.fromARGB(28, 209, 208, 208)
                ],
                onPressed: () => controller.updateUserDetail(),
                // ignore: sort_child_properties_last
                child: const Text(
                  "确认修改",
                  style: TextStyle(
                      fontSize: 20, color: Color.fromARGB(164, 158, 158, 158)),
                ),
                borderRadius: const BorderRadius.all(Radius.circular(113))),
          )
        ],
      ),
    );
  }

  Future myshowModalBottomSheet(BuildContext context, ImagePicker _picker) {
    final size = MediaQuery.of(context).size;
    return showModalBottomSheet(
      elevation: 120,
      context: context,
      barrierColor: Colors.grey.withOpacity(0.2),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(15),
          height: 250,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "提示",
                style:
                    TextStyle(color: OverallSituation.typea[0], fontSize: 27),
              ),
              const Text(
                "请选择文件以用于修改头像",
                style: TextStyle(fontSize: 22),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: GradientButton(
                          borderRadius: BorderRadius.circular(13),
                          colors: OverallSituation.typeb,
                          onPressed: () => controller.inPhotoAlbumSelection(),
                          child: const Text("从相册选择",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.grey)))),
                  const SizedBox(height: 10),
                  SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: GradientButton(
                          borderRadius: BorderRadius.circular(13),
                          colors: OverallSituation.typeb,
                          onPressed: () => controller.takePicture(),
                          child: const Text("拍一张",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.grey)))),
                ],
              ),
            ],
          ),
        );
      },
      constraints:
          BoxConstraints(maxWidth: size.width - 20, minWidth: size.width - 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
    );
  }

  Widget getRightWidgetXX(String name) {
    return Row(
      children: [
        Text(
          name,
          style: const TextStyle(fontSize: 17),
        ),
        const SizedBox(width: 4),
        SvgPicture.asset(
          "assets/svg/chevron-right.svg",
          color: Colors.grey,
          fit: BoxFit.cover,
          width: 18,
        )
      ],
    );
  }
}
