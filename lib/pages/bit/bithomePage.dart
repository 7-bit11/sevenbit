import 'dart:async';
import 'dart:ui';

import 'package:bit_seven/model/bit/bitItemModel.dart';
import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../../model/home/newsModel.dart';

class BitHomePage extends StatefulWidget {
  const BitHomePage({super.key});

  @override
  State<BitHomePage> createState() => _BitHomePageState();
}

class _BitHomePageState extends State<BitHomePage>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late List<String> swiperList;
  late List<ItemModel> itemList;
  final ScrollController controller = ScrollController();
  late bool boolx = true;
  late double sizedBoxh = 300;
  late double ha = 130;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    swiperList = [
      "assets/images/87469375_p0.png",
      "assets/images/67341501_p0.jpg",
      "assets/images/81546410_p0.jpg",
      "assets/images/85670805_p0.jpg",
      "assets/images/85861268_p0.jpg",
      "assets/images/60951991_p0.png"
    ];
    itemList = [
      ItemModel("assets/images/60951991_p0.png", "101漫展节", "2月21日 准点开始"),
      ItemModel("assets/images/67341501_p0.jpg", "1024程序员聚会", "来会场看看谁才是头秃body"),
      ItemModel("assets/images/85670805_p0.jpg", "游戏攻略", "下午三点准时开始直播")
    ];

    controller.addListener(() {
      controller.position;
      //打印滚动位置
      //print(controller.offset);
      if (controller.offset <= 0) {
        setState(() {
          boolx = false;
          sizedBoxh = (ha + 20) * itemList1.length;
        });
      } else if (controller.offset > 0) {
        setState(() {
          boolx = true;
        });
      }
    });
  }

  late List<NewsModel> itemList1 = [
    NewsModel("标题党", "2023-10-10", 123, 456,
        imgUrl: "assets/images/81546410_p0.jpg"),
    NewsModel("标题党", "2023-10-10", 123, 456,
        imgUrl: "assets/images/67341501_p0.jpg"),
    NewsModel("标题党", "2023-10-10", 123, 456,
        imgUrl: "assets/images/85861268_p0.jpg"),
    NewsModel("标题党", "2023-10-10", 123, 456,
        imgUrl: "assets/images/87469375_p0.png"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(elevation: 0),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: 34,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(255, 243, 243, 243),
                          blurRadius: 10,
                          offset: Offset(10, 10))
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: TextField(
                    controller: TextEditingController(),
                    decoration: InputDecoration(
                      prefixIconConstraints: const BoxConstraints(
                          maxHeight: 40,
                          maxWidth: 40,
                          minHeight: 40,
                          minWidth: 40),
                      prefixIcon: SvgPicture.asset(
                        "assets/svg/search.svg",
                        width: 3,
                        height: 3,
                        fit: BoxFit.cover,
                        color: Colors.grey,
                      ),
                      hintText: "搜索、帖子、联系人",
                      border: InputBorder.none,
                      hintStyle: const TextStyle(color: Colors.grey),
                    )),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: 160,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(255, 245, 245, 245),
                          blurRadius: 10,
                          offset: Offset(0, 10))
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Swiper(
                    interval: Duration(seconds: 5),
                    children: swiperList
                        .map((e) => Image.asset(
                              e,
                              fit: BoxFit.cover,
                            ))
                        .toList(),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(100, 245, 245, 245),
                    borderRadius: BorderRadius.circular(40)),
                child: TabBar(
                    labelColor: const Color.fromARGB(250, 245, 245, 245),
                    unselectedLabelColor: const Color.fromARGB(249, 66, 65, 65),
                    indicatorPadding: const EdgeInsets.all(2),
                    labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                    unselectedLabelStyle:
                        const TextStyle(fontWeight: FontWeight.bold),
                    controller: TabController(length: 3, vsync: this),
                    indicator: BoxDecoration(
                        gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            stops: [
                              0.1,
                              1.0
                            ],
                            colors: [
                              Color.fromARGB(180, 29, 80, 255),
                              Color.fromARGB(255, 29, 80, 255)
                            ]),
                        borderRadius: BorderRadius.circular(40)),
                    tabs: const [
                      Tab(text: "附近"),
                      Tab(text: "动态"),
                      Tab(text: "活动")
                    ]),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 120,
              width: double.infinity,
              child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  children: itemList.map((e) => getListItemX(e)).toList()),
            ),
            const SizedBox(height: 20),
            TabBar(
                controller: TabController(length: 5, vsync: this),
                indicatorColor: const Color.fromARGB(255, 29, 80, 255),
                labelStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                unselectedLabelStyle:
                    const TextStyle(fontSize: 15, color: Colors.grey),
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorPadding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 33),
                tabs: const [
                  Tab(text: "综合"),
                  Tab(text: "新闻"),
                  Tab(text: "专访"),
                  Tab(text: "图集"),
                  Tab(text: "视频")
                ]),
            SizedBox(
                height: sizedBoxh,
                width: double.infinity,
                child: TabBarView(
                    controller: TabController(length: 1, vsync: this),
                    children: [
                      TabViewX1x(
                          itemList1,
                          controller,
                          boolx
                              ? const BouncingScrollPhysics()
                              : const NeverScrollableScrollPhysics(),
                          ha)
                    ])),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class TabViewX1x extends StatefulWidget {
  const TabViewX1x(this.datas, this.controller, this.scrollPhysics, this.ha,
      {super.key});
  final ScrollController controller;
  final List<NewsModel> datas;
  final ScrollPhysics scrollPhysics;
  final double ha;
  @override
  State<TabViewX1x> createState() => _TabViewX1xState();
}

class _TabViewX1xState extends State<TabViewX1x> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: widget.scrollPhysics,
      controller: widget.controller,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      shrinkWrap: true,
      children: widget.datas.map((e) => getItemWidgetX1(e, widget.ha)).toList(),
    );
  }
}

// class TabViewX1 extends StatelessWidget {
//   const TabViewX1(this.datas, this.controller, this.scrollPhysics, {super.key});
//   final ScrollController controller;
//   final List<NewsModel> datas;
//   final ScrollPhysics scrollPhysics;
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       //physics: scrollPhysics,
//       padding: const EdgeInsets.symmetric(horizontal: 10),
//       shrinkWrap: true,
//       children: datas.map((e) => getItemWidgetX1(e)).toList(),
//     );
//   }
// }

Widget getListItemX(ItemModel data) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    child: Container(
      width: 280,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(20, 158, 158, 158),
                blurRadius: 10,
                offset: Offset(0, 1))
          ],
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              data.url,
              height: 90,
              width: 90,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: 130,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title,
                  style: const TextStyle(fontSize: 16),
                ),
                Text(data.content,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.grey))
              ],
            ),
          )
        ],
      ),
    ),
  );
}

Widget getItemWidgetX1(NewsModel data, double ha) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Container(
      height: ha,
      decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(20, 158, 158, 158),
                blurRadius: 10,
                offset: Offset(0, 1))
          ],
          borderRadius: BorderRadius.all(Radius.circular(15))),
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              data.imgUrl.toString(),
              fit: BoxFit.cover,
              width: 100,
              height: 100,
            ),
          ),
          const SizedBox(width: 10),
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title,
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(data.time, style: const TextStyle(color: Colors.grey)),
                    Row(
                      children: [
                        const SizedBox(width: 50),
                        Row(children: [
                          SvgPicture.asset(
                            "assets/svg/eye.svg",
                            color: Colors.grey,
                            width: 20,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(width: 5),
                          Text(data.eyeNumber.toString(),
                              style: const TextStyle(color: Colors.grey))
                        ]),
                        const SizedBox(width: 10),
                        Row(children: [
                          SvgPicture.asset(
                            "assets/svg/chat.svg",
                            color: Colors.grey,
                            width: 20,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(width: 5),
                          Text(data.comment.toString(),
                              style: const TextStyle(color: Colors.grey))
                        ])
                      ],
                    )
                  ],
                )
              ])
        ],
      ),
    ),
  );
}
