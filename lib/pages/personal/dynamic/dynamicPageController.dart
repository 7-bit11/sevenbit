import 'package:sevenbit/utils/servicebit.dart';
import 'package:get/get.dart';

import '../../../model/personal_dynamicModel.dart';
import '../../../utils/service_result.dart';

class DynamicPageController extends GetxController {
  DynamicPageController({this.uaccount});

  late String? uaccount;

  late RxList<DynamicModel> dynamicModelList = RxList();

  var isinit = false.obs;

  var isdata = false.obs;

  var a = false;

  void loadData() async {
    ServiceResultData data = await Service.getUserDynamic();
    if (data.code == 200) {
      try {
        if (data.data != null) {
          dynamicModelList.value = data.data;
          isdata.value = true;
        } else {
          isdata.value = false;
        }
        if (!isinit.value) {
          await Future.delayed(const Duration(seconds: 1), () {
            isinit.value = true;
          });
        }
      } catch (e) {
        print("==========================");
        print(e);
      }
    } else {
      isdata.value = false;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
