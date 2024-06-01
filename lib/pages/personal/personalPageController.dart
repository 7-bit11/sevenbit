import 'package:sevenbit/model/personal_UserModel.dart';
import 'package:sevenbit/pages/personal/collection/collectionPageController.dart';
import 'package:sevenbit/pages/personal/message/messagePageController.dart';
import 'package:sevenbit/utils/service_result.dart';
import 'package:sevenbit/utils/servicebit.dart';

import 'package:get/get.dart';

import 'dynamic/dynamicPageController.dart';

class PersonalPageController extends GetxController {
  late RxInt indexNum = 0.obs;
  late User user;
  late Rx<User> ux = Rx(user);
  late var isBool = false.obs;
  late var isinit = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadData();
  }

  void loadData() async {
    ServiceResultData data = await Service.getUserDetails("");
    user = data.data;
    ux.value = data.data;
    isinit.value = true;
  }

  Future<void> onRefresh() async {
    //模拟网络请求
    await Future.delayed(const Duration(milliseconds: 1000));
    loadData();
    //结束刷新
    try {
      if (indexNum.value == 0) {
        DynamicPageController dyco = Get.find<DynamicPageController>();
        dyco.loadData();
      } else if (indexNum.value == 1) {
        CollectionPageController coco = Get.find<CollectionPageController>();
        coco.loadData();
      } else if (indexNum.value == 2) {
        MessagePageController meco = Get.find<MessagePageController>();
        meco.loadData();
      }
    } catch (e) {
      print("object=====================");
      print(e);
    }
  }
}
