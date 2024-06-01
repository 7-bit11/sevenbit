import 'package:bit_seven/model/personal_messageModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                ClipOval(
                  child: Image.asset(data.imgurl,
                      fit: BoxFit.cover, width: 40, height: 40),
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
            // SvgPicture.asset(
            //   "assets/svg/dots-horizontal.svg",
            //   color: Colors.grey,
            // )
          ],
        ),
        const SizedBox(height: 13)
      ],
    );
  }
}
