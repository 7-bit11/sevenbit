import 'package:sevenbit/pages/personal/message/messagePageController.dart';
import 'package:sevenbit/widget/noDataWidget.dart';
import 'package:sevenbit/widget/personal/message/messageWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../utils/overall_situation.dart';

class MessagePage extends GetView<MessagePageController> {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MessagePageController());
    final size = MediaQuery.of(context).size;
    return Obx(() => !controller.isinit.value
        ? Container(
            padding: EdgeInsets.symmetric(horizontal: size.width / 2 - 50),
            width: 100,
            height: 30,
            child: LoadingAnimationWidget.staggeredDotsWave(
                color: OverallSituation.typea[0], size: 40),
          )
        : controller.isdata.value
            ? Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color.fromARGB(255, 250, 250, 250),
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromARGB(57, 158, 158, 158),
                        blurRadius: 10,
                        offset: Offset(0, 10))
                  ],
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Text("留言板", style: TextStyle(fontSize: 18)),
                        const SizedBox(width: 10),
                        // ignore: invalid_use_of_protected_member
                        Text("(共${controller.msgList.value.length}条)",
                            style: const TextStyle(color: Colors.grey))
                      ],
                    ),
                    ListView(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      // ignore: invalid_use_of_protected_member
                      children: controller.msgList.value
                          .map((e) => MessageWidget(e))
                          .toList(),
                    )
                  ],
                ),
              )
            : getNoDataWidget(size.width / 2));
  }
}
