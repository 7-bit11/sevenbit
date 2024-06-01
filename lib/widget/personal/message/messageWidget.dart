import 'package:sevenbit/model/personal_messageModel.dart';
import 'package:sevenbit/utils/netUrl.dart';
import 'package:sevenbit/widget/image/ImageWidget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../pages/user/userDetails.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget(this.data, {super.key});
  final MessageModel data;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(
                        UserDetailsPage(
                            "${netUrl.bitnetUrl}getImg/${data.imgurl}",
                            data.creTime,
                            data.account),
                        transition: Transition.rightToLeft);
                  },
                  child: Hero(
                    tag:
                        "${netUrl.bitnetUrl}getImg/${data.imgurl}${data.creTime}",
                    child: ClipOval(
                      child: MyCachedNetworkImage(
                          "${netUrl.bitnetUrl}getImg/${data.imgurl}",
                          width: 40,
                          height: 40),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Text(data.name, style: const TextStyle(fontSize: 16)),
                    SizedBox(
                      width: 230,
                      child: Text(
                        data.body,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    Text(
                      data.creTime,
                      style: const TextStyle(color: Colors.grey),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
        const SizedBox(height: 13)
      ],
    );
  }
}
