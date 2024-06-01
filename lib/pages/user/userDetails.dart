import 'package:bit_seven/utils/overall_situation.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../model/personal_dynamicModel.dart';
import '../../model/personal_messageModel.dart';
import '../circle/circlePage.dart';
import '../personal/dynamic/dynamicPage.dart';
import '../personal/message/messagePage.dart';

class UserDetailsPage extends StatefulWidget {
  const UserDetailsPage(this.userUrl, {super.key});
  final String userUrl;

  @override
  State<UserDetailsPage> createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage>
    with TickerProviderStateMixin {
  late final List<Widget> body;
  late bool isgz = false;
  late List<DynamicModel> mydata;
  late List<MessageModel> _msgList;
  late TabController tabController = TabController(length: 2, vsync: this);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mydata = [
      DynamicModel([
        "assets/images/85670805_p0.jpg",
        "assets/images/85861268_p0.jpg",
        "assets/images/60951991_p0.png"
      ], "分享一波最新壁纸", "2023.2.13", 23, 78, "成都"),
      DynamicModel([
        "assets/images/87469375_p0.png",
        "assets/images/67341501_p0.jpg",
        "assets/images/81546410_p0.jpg"
      ], "爷就喜欢这种东西", "2023.3.2", 154, 847, "北京")
    ];
    _msgList = [
      MessageModel("assets/images/my.jpg", "明日香", "今日香，明日臭", "2023.2.14 15:30"),
      MessageModel("assets/images/lbl.jpg", "凌波丽",
          "绫波丽，日本动画系列作品《新世纪福音战士》及漫画版中的女主角", "2023.2.14 15:30"),
      MessageModel(
          "assets/images/zs.jpg", "碇真嗣", "性格内向，不擅长与人交流", "2023.2.14 15:30"),
      MessageModel(
          "assets/images/yt.jpg", "于涛", "九转大肠，我保留了一部分的味道！", "2023.2.14 15:30"),
      MessageModel(
          "assets/images/ls.jpg", "评委老师", "不管你做的什么，我都爱吃", "2023.2.14 15:30")
    ];
    body = [DynamicPage(mydata), MessagePage(_msgList)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(0),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: SvgPicture.asset(
            "assets/svg/chevron-left.svg",
            fit: BoxFit.none,
          ),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text(
                          "7_bit",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "生活就像GTA，你我都像NPC",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                    ClipOval(
                      child: Hero(
                        tag: widget.userUrl,
                        child: CachedNetworkImage(
                          imageUrl: widget.userUrl,
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    SizedBox(
                      height: 30,
                      child: GradientButton(
                          splashColor: Colors.white.withOpacity(0.0),
                          colors: isgz
                              ? OverallSituation.typeb
                              : OverallSituation.typea,
                          onPressed: () {
                            setState(() {
                              isgz = !isgz;
                            });
                          },
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                          child: Text(
                            "关注",
                            style: TextStyle(
                                fontSize: 17,
                                color: isgz ? Colors.grey : Colors.white),
                          )),
                    ),
                    const SizedBox(width: 10),
                    Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            color: OverallSituation.typeb[0],
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: OverallSituation.typeb),
                            borderRadius: BorderRadius.circular(3)),
                        child: SvgPicture.asset(
                          "assets/svg/mail.svg",
                          width: 15,
                          height: 15,
                          fit: BoxFit.cover,
                          color: Colors.grey.withOpacity(0.8),
                        )),
                  ],
                ),
                const SizedBox(height: 30),
                Container(
                  alignment: Alignment.center,
                  height: 60,
                  child: StaggeredGrid.count(
                    crossAxisCount: 4,
                    crossAxisSpacing: 50,
                    children: [
                      getItemuNuber("192", "粉丝"),
                      getItemuNuber("168", "关注"),
                      getItemuNuber("1", "群组")
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(240, 245, 245, 245),
                      borderRadius: BorderRadius.circular(40)),
                  child: TabBar(
                      onTap: (v) {
                        setState(() {});
                      },
                      labelColor: const Color.fromARGB(250, 245, 245, 245),
                      unselectedLabelColor:
                          const Color.fromARGB(249, 66, 65, 65),
                      indicatorPadding: const EdgeInsets.all(2),
                      labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                      unselectedLabelStyle:
                          const TextStyle(fontWeight: FontWeight.bold),
                      controller: tabController,
                      indicator: BoxDecoration(
                          gradient: const LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              stops: [0.2, 1.0],
                              colors: OverallSituation.typea),
                          borderRadius: BorderRadius.circular(15)),
                      tabs: const [Tab(text: "动态"), Tab(text: "留言")]),
                ),
                const SizedBox(height: 20),
                body[tabController.index],
                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget getItemuNuber(String number, String name) {
  return Column(
    children: [
      Text(
        number,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      Text(
        name,
        style: const TextStyle(color: Colors.grey),
      )
    ],
  );
}
