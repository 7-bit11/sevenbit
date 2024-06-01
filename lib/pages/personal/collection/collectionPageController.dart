import 'package:sevenbit/utils/servicebit.dart';
import 'package:get/get.dart';

import '../../../model/personal_collectionModel.dart';

class CollectionPageController extends GetxController {
  late RxList<CollectionModel> collectionModelList = RxList(); //数据源

  late var isinit = false.obs; //是否初始化

  late var isgx = false.obs; //是否修改

  var isdata = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadData();
  }

  /*初始化数据 */
  void loadData() async {
    try {
      var data = await Service.getUserCollectionList();
      if (data.code == 200) {
        if (data.data != null) {
          collectionModelList.value = data.data;
          isdata.value = true;
        } else {
          isdata.value = false;
        }
        if (!isinit.value) {
          await Future.delayed(const Duration(seconds: 1), () {
            isinit.value = true;
          });
        }
      } else {
        isdata.value = false;
      }
    } catch (e) {
      print("---------------------");
      print(e);
    }
  }
}
