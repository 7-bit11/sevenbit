import 'dart:io';
import 'dart:typed_data';

import 'package:sevenbit/utils/service_result.dart';
import 'package:date_format/date_format.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../model/personal_UserModel.dart';
import '../../../utils/servicebit.dart';
import '../../image/cut_image.dart';

class DetailsPageController extends GetxController {
  DetailsPageController(this.user);

  late User user;

  bool isxg = false; //是否正在修改

  var xgimg = false.obs; //是否修改头像

  var xgname = false.obs; //是否修改名称

  var xgbody = false.obs; //是否修改内容

  var xgsex = false.obs; //是否修改性别

  var xgAddress = false.obs; //是否修改地址

  var xgoccupation = false.obs; //是否修改职业

  var xgbirthday = false.obs; //是否修改生日

  final ImagePicker picker = ImagePicker();

  String getCurrentTime(DateTime dateTime) {
    String currentTime = formatDate(dateTime, [yyyy, '年', mm, '月', dd, '日']);
    return currentTime;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  /*更新个人信息 */
  void updateUserDetail() async {
    EasyLoading.show(status: "信息修改中...");
    if (!isxg) {
      isxg = true;
      ServiceResult serviceResult = await Service.updateUserDetails(user);
      if (serviceResult.success) {
        EasyLoading.showToast('修改成功',
            duration: const Duration(milliseconds: 1500));
      } else {
        EasyLoading.showToast('修改失败,请稍后重试',
            duration: const Duration(milliseconds: 1500));
      }
      isxg = false;
    }
  }

  /*从相册选择图片上传 */
  void inPhotoAlbumSelection() async {
    FilePickerResult? filePickerResult =
        await FilePicker.platform.pickFiles(type: FileType.image);
    if (filePickerResult?.count != null) {
      PlatformFile? file = filePickerResult?.files.first;
      if (file?.path != null) {
        File file1 = File(file!.path!);
        var data =
            await Get.to(CutImagePage(file1), transition: Transition.downToUp);
        uploadImage(data);
      }
    }
  }

  /* 拍一张图片进行上传 */
  void takePicture() async {
    var filex = await picker.pickImage(source: ImageSource.camera);
    File file123 = File.fromUri(Uri.parse(filex!.path));
    var data =
        await Get.to(CutImagePage(file123), transition: Transition.downToUp);
    uploadImage(data);
  }

  /*上传图片 */
  void uploadImage(Uint8List uint8list) async {
    Get.back();
    EasyLoading.show(status: "上传中...");
    ServiceResult serviceResult = await Service.uploadImage(uint8list);
    if (serviceResult.success) {
      EasyLoading.showToast('头像修改成功',
          duration: const Duration(milliseconds: 1500));
      user.userImgUrl = serviceResult.msg;
      xgimg.value = !xgimg.value;
    }
  }
}
