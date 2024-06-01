import 'dart:convert';
import 'dart:io';

import 'dart:math';
import 'dart:typed_data';

import 'package:bit_seven/model/personal_UserModel.dart';
import 'package:bit_seven/pages/image/cut_image.dart';
import 'package:bit_seven/utils/servicebit.dart';
import 'package:bit_seven/widget/personal/details/detailsWidget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:date_format/date_format.dart';
import 'package:extended_image/extended_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_pickers/pickers.dart';
import 'package:flutter_pickers/style/picker_style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bit_seven/utils/netUrl.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:extended_image/extended_image.dart' as img;
import '../../../utils/overall_situation.dart';
import '../../../utils/service_result.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage(this._user, {super.key});
  final User _user;
  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  Future<void> _onRefresh() async {
    //模拟网络请求
    // ignore: prefer_const_constructors
    await Future.delayed(Duration(milliseconds: 2000));
    //结束刷新
    return Future.value(true);
  }

  String getCurrentTime(DateTime dateTime) {
    String currentTime = formatDate(dateTime, [yyyy, '年', mm, '月', dd, '日']);
    return currentTime;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
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
                  myshowModalBottomSheet(context, _picker);
                },
                child: Hero(
                  tag: "${netUrl.bitnetUrl}getImg/${widget._user.userImgUrl}",
                  child: ClipOval(
                    child: CachedNetworkImage(
                        imageUrl:
                            "${netUrl.bitnetUrl}getImg/${widget._user.userImgUrl}",
                        fit: BoxFit.cover,
                        width: 50,
                        height: 50,
                        errorWidget: (context, url, error) {
                          return Image.asset(
                            "assets/images/yt.jpg",
                            fit: BoxFit.cover,
                            width: 50,
                            height: 50,
                          );
                        }),
                  ),
                ),
              ),
              "头像",
              () {}),
          DetailsWidget(getRightWidgetXX(widget._user.userName), "昵称", () {
            Pickers.showSinglePicker(context,
                data: ["7_bit", "seven_bit"],
                selectData: widget._user.userName, onConfirm: (p, position) {
              setState(() {
                widget._user.userName = p;
              });
            });
          }),
          DetailsWidget(getRightWidgetXX(widget._user.userSex), "性别", () {
            Pickers.showSinglePicker(context,
                pickerStyle: PickerStyle(textSize: 18),
                data: ["男", "女"],
                selectData: widget._user.userSex, onConfirm: (p, position) {
              setState(() {
                widget._user.userSex = p;
              });
            });
          }),
          DetailsWidget(
              getRightWidgetXX(getCurrentTime(widget._user.birthday)), "生日",
              () {
            DatePicker.showDatePicker(context,
                showTitleActions: true,
                minTime: DateTime(1899, 1, 1),
                maxTime: DateTime(2077, 12, 12),
                onChanged: (date) {}, onConfirm: (date) {
              setState(() {
                widget._user.birthday = date;
              });
            }, currentTime: widget._user.birthday, locale: LocaleType.zh);
          }),
          DetailsWidget(
              getRightWidgetXX(
                  "${widget._user.province}-${widget._user.city}-${widget._user.town}"),
              "住址", () {
            Pickers.showAddressPicker(
              context,
              addAllItem: false,
              initProvince: widget._user.province,
              initCity: widget._user.city,
              initTown: widget._user.town,
              onConfirm: (p, c, x) {
                setState(() {
                  widget._user.province = p;
                  widget._user.city = c;
                  widget._user.town = x!;
                });
              },
            );
          }),
          DetailsWidget(getRightWidgetXX(widget._user.occupation), "职业", () {}),
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
                onPressed: () async {
                  ServiceResult serviceResult =
                      await Service.updateUserDetails(widget._user);
                  if (serviceResult.success) {
                    EasyLoading.showToast('修改成功',
                        duration: const Duration(milliseconds: 1500));
                    //loadData();
                  } else {
                    EasyLoading.showToast('修改失败,请稍后重试',
                        duration: const Duration(milliseconds: 1500));
                  }
                },
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

// Uint8List uint8list,
  void uploadImage(PlatformFile? file, Uint8List uint8list) async {
    if (file != null) {
      EasyLoading.show(status: "上传中...");
      ServiceResult serviceResult = await Service.uploadImage(file, uint8list);
      if (serviceResult.success) {
        EasyLoading.showToast('头像修改成功',
            duration: const Duration(milliseconds: 1500));
        setState(() {
          widget._user.userImgUrl = serviceResult.msg;
          Navigator.pop(context);
        });
      }
    }
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
                          onPressed: () async {
                            FilePickerResult? filePickerResult =
                                await FilePicker.platform
                                    .pickFiles(type: FileType.image);

                            if (filePickerResult?.count != null) {
                              PlatformFile? file =
                                  filePickerResult?.files.first;
                              if (file?.path != null) {
                                File file1 = File(file!.path!);
                                var data = await Get.to(CutImagePage(file1),
                                    transition: Transition.downToUp);
                                uploadImage(file, data);
                              }
                            }
                          },
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
                          onPressed: () {
                            _picker.pickImage(source: ImageSource.camera);
                          },
                          child: const Text("拍一张",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.grey)))),
                ],
              ),
              //SizedBox(height: 5)
            ],
          ),
        );
      },
      constraints:
          BoxConstraints(maxWidth: size.width - 20, minWidth: size.width - 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
    );
  }
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
