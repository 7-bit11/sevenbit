// ignore_for_file: invalid_use_of_protected_member

import 'package:sevenbit/pages/dynamic_detail_page.dart';
import 'package:sevenbit/pages/personal/dynamic/dynamicPageController.dart';
import 'package:sevenbit/utils/overall_situation.dart';
import 'package:sevenbit/widget/noDataWidget.dart';
import 'package:sevenbit/widget/personal/dynamic/dynamicWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class DynamicPage extends GetView<DynamicPageController> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Get.put(DynamicPageController());
    return Obx(() => !controller.isinit.value
        ? Container(
            padding: EdgeInsets.symmetric(horizontal: size.width / 2 - 50),
            width: 100,
            height: 30,
            child: LoadingAnimationWidget.staggeredDotsWave(
                color: OverallSituation.typea[0], size: 40),
          )
        : controller.isdata.value
            ? ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.dynamicModelList.value.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(
                          DynamicDetailPage(
                              controller.dynamicModelList.value[index].id),
                          transition: Transition.rightToLeft);
                    },
                    child:
                        DynamicWidget(controller.dynamicModelList.value[index]),
                  );
                })
            : getNoDataWidget(size.width / 2));
  }
}
