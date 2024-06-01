import 'dart:ui';

import 'package:bit_seven/pages/search/searchPage.dart';
import 'package:bit_seven/pages/user/userDetails.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../model/circle/circleModel.dart';
import '../../utils/overall_situation.dart';
import '../../widget/indicator.dart';
import '../nearby/nearbyPage.dart';

class CirclePage extends StatefulWidget {
  const CirclePage({super.key});

  @override
  State<CirclePage> createState() => _CirclePageState();
}

class _CirclePageState extends State<CirclePage>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late List<CircleModel> circleModelList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    circleModelList = getCircleModelList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: GestureDetector(
            onTap: () {
              Get.to(SearchPage());
            },
            child: AbsorbPointer(
              child: Hero(
                tag: "TextFieldss",
                child: Container(
                  height: 35,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(50, 243, 243, 243),
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
                        hintText: "搜索联系人",
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.grey),
                      )),
                ),
              ),
            ),
          ),
        ),
        // extendBodyBehindAppBar: true,
        body: Container(
            height: double.infinity,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            //color: Color.fromARGB(255, 29, 80, 255),
            child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                children: [
                  // const SizedBox(height: 75),
                  // const SizedBox(height: 20),
                  Container(
                    alignment: Alignment.center,
                    height: 80,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(75, 235, 235, 235),
                              blurRadius: 10,
                              offset: Offset(0, 10))
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: StaggeredGrid.count(
                      crossAxisCount: 4,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                      children: [
                        getupdownWidget1("标题1", "assets/svg/speakerphone.svg"),
                        getupdownWidget1("标题2", "assets/svg/star.svg"),
                        getupdownWidget1("标题3", "assets/svg/annotation.svg"),
                        getupdownWidget1("标题4", "assets/svg/thumb-up.svg")
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    alignment: Alignment.center,
                    height: 60,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(75, 235, 235, 235),
                              blurRadius: 10,
                              offset: Offset(0, 10))
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: StaggeredGrid.count(
                      crossAxisCount: 6,
                      crossAxisSpacing: 15,
                      children: [
                        getItemImg(),
                        getItemImg(),
                        getItemImg(),
                        getItemImg(),
                        getItemImg(),
                        GestureDetector(
                            onTapDown: (v) async {
                              await showRightMenu(context, v.globalPosition.dx,
                                  v.globalPosition.dy, items: [
                                MapEntry("修改", "edit"),
                                MapEntry("删除", "delete")
                              ]);
                            },
                            child: AbsorbPointer(
                              child: IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                    "assets/svg/dots-vertical.svg"),
                              ),
                            )),
                      ],
                    ),
                  ),
                  TabBar(
                      indicator: const Indicator(
                          color: Color.fromARGB(255, 29, 80, 255)),
                      indicatorColor: const Color.fromARGB(255, 29, 80, 255),
                      labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                      unselectedLabelStyle:
                          const TextStyle(fontSize: 15, color: Colors.grey),
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorPadding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 40),
                      controller: TabController(length: 3, vsync: this),
                      tabs: const [
                        Tab(text: "热门"),
                        Tab(text: "热门"),
                        Tab(text: "热门")
                      ]),
                  ListView(
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: circleModelList
                          .map((e) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: getItemX(e, () {
                                  setState(() {
                                    e.attention = !e.attention;
                                  });
                                }),
                              ))
                          .toList())
                ])));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

Widget getItemX(CircleModel data, Function() ontap) {
  late TextStyle textStyle = const TextStyle(color: Colors.grey);
  return Container(
    width: double.infinity,
    height: 300,
    padding: const EdgeInsets.symmetric(horizontal: 10),
    decoration: BoxDecoration(boxShadow: const [
      BoxShadow(
          color: Color.fromARGB(75, 235, 235, 235),
          blurRadius: 10,
          offset: Offset(0, 10))
    ], color: Colors.white, borderRadius: BorderRadius.circular(15)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipOval(
                      child: Image.asset(
                    data.userImg,
                    fit: BoxFit.cover,
                    width: 45,
                    height: 45,
                  )),
                  const SizedBox(width: 10),
                  Text(
                    data.userName,
                    style: const TextStyle(fontSize: 18),
                  )
                ],
              ),
              SizedBox(
                width: 70,
                height: 25,
                child: GradientButton(
                    splashColor: Colors.white.withOpacity(0.0),
                    colors: !data.attention
                        ? OverallSituation.typeb
                        : OverallSituation.typea,
                    onPressed: ontap,
                    borderRadius: const BorderRadius.all(Radius.circular(113)),
                    child: Text(
                      "关注",
                      style: TextStyle(
                          color: !data.attention
                              ? OverallSituation.typea[0]
                              : Colors.white),
                    )),
              ),
            ],
          ),
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Get.to(UserDetailsPage(data.videoImg));
              },
              child: Hero(
                tag: data.videoImg,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: data.videoImg,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 180,
                  ),
                ),
              ),
            ),
            SvgPicture.asset(
              "assets/svg/play.svg",
              color: Colors.white.withOpacity(0.8),
              fit: BoxFit.cover,
              width: 30,
            ),
            Positioned(
              left: 10,
              bottom: 10,
              child: Text(
                data.videoTime,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  shadows: const [
                    Shadow(
                      blurRadius: 10,
                      color: Color.fromARGB(200, 0, 0, 0),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 10,
              bottom: 10,
              child: Row(
                children: [
                  SvgPicture.asset(
                    "assets/svg/eye.svg",
                    fit: BoxFit.cover,
                    color: Colors.white.withOpacity(0.8),
                    width: 15,
                  ),
                  Text(
                    data.lookNumber.toString(),
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      shadows: const [
                        Shadow(
                          blurRadius: 10,
                          color: Color.fromARGB(200, 0, 0, 0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          data.videoTitle,
          style: const TextStyle(fontSize: 16),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  "${data.createTime.year}-${data.createTime.month}-${data.createTime.day}",
                  style: textStyle,
                ),
                const SizedBox(width: 8),
                Text("成都", style: textStyle)
              ],
            ),
            Row(
              children: [
                getLsvgRnumber("assets/svg/chat.svg",
                    data.commentNumber.toString(), textStyle),
                const SizedBox(width: 10),
                getLsvgRnumber("assets/svg/eye.svg",
                    data.giveUpNumber.toString(), textStyle),
              ],
            )
          ],
        )
      ],
    ),
  );
}

Widget getLsvgRnumber(String svgurl, String number, TextStyle style) {
  return Row(
    children: [
      SvgPicture.asset(
        svgurl,
        fit: BoxFit.cover,
        width: 13,
        color: style.color,
      ),
      const SizedBox(width: 5),
      Text(number, style: style)
    ],
  );
}

Widget getItemImg() {
  return Container(
    decoration: BoxDecoration(
        border: Border.all(
            color: const Color.fromARGB(205, 29, 80, 255), width: 1.5),
        borderRadius: BorderRadius.circular(42)),
    child: ClipOval(
        child: Image.asset(
      "assets/images/81546410_p0.jpg",
      fit: BoxFit.cover,
      width: 40,
      height: 40,
    )),
  );
}

Future showRightMenu(BuildContext context, dx, dy,
    {List<MapEntry<String, dynamic>>? items, Size? size, Widget? menu}) async {
  double sw = MediaQuery.of(context).size.width; //屏幕宽度
  double sh = MediaQuery.of(context).size.height; //屏幕高度
  Border border = dy < sh / 2
      ? //
      const Border(
          top: BorderSide(color: Color.fromARGB(205, 29, 80, 255), width: 2))
      : const Border(
          bottom:
              BorderSide(color: Color.fromARGB(205, 29, 80, 255), width: 2));
//如果传了items参数则根据items生成菜单
  if (items != null && items.length > 0) {
    double itemWidth = 80.0;
    double itemHeight = 50.0;
    double menuHeight = itemHeight * items.length + 2;

    size = Size(itemWidth, menuHeight);

    menu = Container(
      decoration: BoxDecoration(color: Colors.white, border: border),
      child: Column(
        children: items
            .map((e) => InkWell(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: itemWidth,
                    height: itemHeight,
                    child: Text(
                      e.key,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  onTap: () {},
                ))
            .toList(),
      ),
    );
  }
  Size sSize = MediaQuery.of(context).size;

// PopupMenuItem

  double? menuW = size?.width; //菜单宽度
  double? menuH = size?.height; //菜单高度
  //判断手势位置在屏幕的那个区域以判断最好的弹出方向
  double endL = dx < sw / 2 ? dx : dx - menuW;
  double endT = dy < sh / 2 ? dy : dy - menuH;
  double endR = dx < sw / 2 ? dx + menuW : dx;
  double endB = dy < sh / 2 ? dy + menuH : dy;

  return await showGeneralDialog(
      context: context,
      pageBuilder: (context, anim1, anim2) {
        //由于用了组件放大的动画效果，所以用了SingleChildScrollView包裹
        //否则在组件小的时候会出现菜单超出编辑的错误
        return SingleChildScrollView(child: menu);
      },
      barrierColor: Colors.grey.withOpacity(0), //弹窗后的背景遮罩色，调来调去还是透明的顺眼
      barrierDismissible: true,
      barrierLabel: "",
      transitionDuration: Duration(milliseconds: 200), //动画时间

      transitionBuilder: (context, anim1, anim2, child) {
        return Stack(
          children: [
            // 有好多种Transition来实现不同的动画效果，可以参考官方API
            PositionedTransition(
                rect: RelativeRectTween(
                  begin: RelativeRect.fromSize(
                      //动画起始位置与元素大小
                      Rect.fromLTWH(dx, dy, 1, 1),
                      sSize),
                  end: RelativeRect.fromSize(
                      //动画结束位置与元素大小
                      Rect.fromLTRB(endL, endT, endR, endB),
                      sSize),
                ).animate(CurvedAnimation(parent: anim1, curve: Curves.ease)),
                child: child)
          ],
        );
      });
}
