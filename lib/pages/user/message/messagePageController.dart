import 'package:sevenbit/model/personal_messageModel.dart';
import 'package:sevenbit/utils/service_result.dart';
import 'package:sevenbit/utils/servicebit.dart';
import 'package:get/get.dart';

class UserMessagePageController extends GetxController {
  UserMessagePageController({this.uaccount});
  late RxList<MessageModel> msgList = RxList();
  late String? uaccount;
  late var isinit = false.obs;
  var isdata = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadData();
  }

  void loadData() async {
    ServiceResultData data = await Service.getUserMessageList(uaccount!);
    if (data.code == 200) {
      if (data.data != null) {
        msgList.value = data.data;
        isdata.value = true;
      } else {
        isdata.value = false;
      }
      if (!isinit.value) {
        await Future.delayed(const Duration(seconds: 2), () {
          isinit.value = true;
        });
      }
    } else {
      isdata.value = false;
    }
  }
}
