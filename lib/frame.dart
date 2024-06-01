import 'dart:math';

import 'package:bit_seven/pages/bit/bithomePage.dart';
import 'package:bit_seven/pages/circle/circlePage.dart';
import 'package:bit_seven/pages/home/HomePage.dart';
import 'package:bit_seven/pages/nearby/nearbyPage.dart';
import 'package:bit_seven/pages/personal/PersonalPage.dart';
import 'package:bit_seven/utils/android_call.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'model/personal_messageModel.dart';

class FramePage extends StatefulWidget {
  const FramePage({super.key});

  @override
  State<FramePage> createState() => _FramePageState();
}

class _FramePageState extends State<FramePage>
    with AutomaticKeepAliveClientMixin {
  late List<MessageModel> _msgList;
  late List<Widget> itemPage;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _msgList = [
      MessageModel("assets/images/my.jpg", "明日香", "今日香，明日臭", "20小时前"),
      MessageModel("assets/images/lbl.jpg", "凌波丽",
          "绫波丽，日本动画系列作品《新世纪福音战士》及漫画版中的女主角", "20小时前"),
      MessageModel("assets/images/zs.jpg", "碇真嗣", "性格内向，不擅长与人交流", "20小时前"),
      MessageModel("assets/images/yt.jpg", "于涛", "九转大肠，我保留了一部分的味道！", "20小时前"),
      MessageModel("assets/images/ls.jpg", "评委老师", "不管你做的什么，我都爱吃", "20小时前")
    ];
    itemPage = [HomePage(), CirclePage(), NearbyPage(_msgList), PersonalPage()];
  }

  int _indexPage = 3;
  final List<BottomNavigationBarItem> _barItem = [
    BottomNavigationBarItem(
        label: "",
        activeIcon: SvgPicture.asset(
          "assets/svg/home.svg",
          color: const Color.fromARGB(255, 29, 80, 255),
        ),
        icon: SvgPicture.asset(
          "assets/svg/home.svg",
          color: Colors.grey,
        )),
    BottomNavigationBarItem(
        label: "",
        activeIcon: SvgPicture.asset(
          "assets/svg/annotation.svg",
          color: const Color.fromARGB(255, 29, 80, 255),
        ),
        icon:
            SvgPicture.asset(color: Colors.grey, "assets/svg/annotation.svg")),
    BottomNavigationBarItem(
        label: "",
        activeIcon: SvgPicture.asset(
          "assets/svg/chat_alt.svg",
          color: const Color.fromARGB(255, 29, 80, 255),
        ),
        icon: SvgPicture.asset(color: Colors.grey, "assets/svg/chat_alt.svg")),
    BottomNavigationBarItem(
        label: "",
        activeIcon: SvgPicture.asset(
          "assets/svg/user-circle.svg",
          color: const Color.fromARGB(255, 29, 80, 255),
        ),
        icon:
            SvgPicture.asset(color: Colors.grey, "assets/svg/user-circle.svg"))
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await AndroidCall.backDesktop();
        return false;
      },
      child: Scaffold(
          body: itemPage[_indexPage],
          bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: _indexPage,
            elevation: 0,
            onTap: (value) {
              setState(() {
                _indexPage = value;
              });
            },
            items: _barItem,
          )),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
