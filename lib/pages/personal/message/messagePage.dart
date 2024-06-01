import 'package:bit_seven/model/personal_messageModel.dart';
import 'package:bit_seven/widget/personal/message/messageWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MessagePage extends StatefulWidget {
  const MessagePage(this._msgList, {super.key});
  final List<MessageModel> _msgList;
  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Row(
            children: [
              const Text("留言板", style: TextStyle(fontSize: 18)),
              const SizedBox(width: 10),
              Text("(共${widget._msgList.length}条)",
                  style: const TextStyle(color: Colors.grey))
            ],
          ),
          ListView(
            padding: const EdgeInsets.symmetric(vertical: 20),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: widget._msgList.map((e) => MessageWidget(e)).toList(),
          )
        ],
      ),
    );
  }
}
