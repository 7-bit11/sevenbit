import 'package:bit_seven/model/home/atlasModel.dart';
import 'package:bit_seven/model/home/everydayModel.dart';
import 'package:bit_seven/pages/bit/bithomePage.dart';
import 'package:bit_seven/pages/home/childern/NewsPage.dart';
import 'package:bit_seven/pages/home/childern/atlasPage.dart';
import 'package:bit_seven/pages/home/childern/everydayPage.dart';
import 'package:bit_seven/utils/servicebit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../../utils/service_result.dart';
import '../../widget/indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late List<Tab> myTabs;
  late List<Widget> myPages;
  late TabController _tabController;
  late List<EverydayModel> _everydayModelList;
  late List<AtlasModel> _atlasModelList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    myTabs = const [
      Tab(text: "综合"),
      Tab(text: "推荐图集"),
      Tab(text: "经典老番"),
      Tab(text: "新闻")
    ];
    _everydayModelList = [
      EverydayModel("assets/images/85861268_p0.jpg", "《EVA》中国特供版正式上映", 128, 62,
          "13:15", 66),
      EverydayModel(
          "assets/images/67341501_p0.jpg", "summerTime", 128, 62, "13:15", 66),
      EverydayModel(
          "assets/images/81546410_p0.jpg", "黑皮loli水着", 128, 62, "13:15", 66),
      EverydayModel("assets/images/85670805_p0.jpg", "《原神》看我5连648抽出新角色", 128,
          62, "13:15", 66),
    ];
    _atlasModelList = [
      AtlasModel("assets/images/60951991_p0.png", "新年快乐"),
      AtlasModel("assets/images/87469375_p0.png", "笗"),
      AtlasModel("assets/images/ls.jpg", "."),
      AtlasModel("assets/images/zs.jpg", ".."),
      AtlasModel("assets/images/my.jpg", "修狗"),
      AtlasModel("assets/images/lbl.jpg", "丽"),
      AtlasModel("assets/images/yt.jpg", "yt")
    ];
    myPages = [
      BitHomePage(),
      AtlasPage(_atlasModelList),
      EverydayPage(_everydayModelList),
      NewsPage()
    ];
    _tabController = TabController(length: myPages.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        //extendBodyBehindAppBar: true,
        appBar: AppBar(
          shadowColor: const Color.fromARGB(255, 255, 255, 255),
          elevation: 0,
          toolbarHeight: 0,
          bottom: tabBarStyleTypea(myTabs, _tabController),
        ),
        body: TabBarView(
          controller: _tabController,
          children: myPages,
        ));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

TabBar tabBarStyleTypea(List<Tab> myTabs, TabController tabController) {
  return TabBar(
    indicator: const Indicator(color: Color.fromARGB(255, 29, 80, 255)),
    tabs: myTabs,
    isScrollable: true,
    indicatorColor: const Color.fromARGB(255, 29, 80, 255),
    indicatorSize: TabBarIndicatorSize.label,
    physics: const BouncingScrollPhysics(),
    labelStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
    controller: tabController,
  );
}
