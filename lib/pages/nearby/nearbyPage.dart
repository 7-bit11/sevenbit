import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../model/personal_messageModel.dart';

class NearbyPage extends StatefulWidget {
  const NearbyPage(this._msgList, {super.key});
  final List<MessageModel> _msgList;
  @override
  State<NearbyPage> createState() => _NearbyPageState();
}

class _NearbyPageState extends State<NearbyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0),
      extendBodyBehindAppBar: true,
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
              const SizedBox(height: 50),
              Container(
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
                          maxHeight: 30,
                          maxWidth: 30,
                          minHeight: 30,
                          minWidth: 30),
                      suffixIcon: SvgPicture.asset(
                        "assets/svg/chat_alt.svg",
                        fit: BoxFit.none,
                        color: Color.fromARGB(144, 158, 158, 158),
                      ),
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
              SizedBox(height: 30),
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
                    getupdownWidget("公告", "assets/svg/speakerphone.svg"),
                    getupdownWidget("收藏", "assets/svg/star.svg"),
                    getupdownWidget("评论", "assets/svg/annotation.svg"),
                    getupdownWidget("赞", "assets/svg/thumb-up.svg")
                  ],
                ),
              ),
              SizedBox(height: 30),
              Container(
                  padding: EdgeInsets.all(10),
                  height: 400,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(180, 235, 235, 235),
                            blurRadius: 10,
                            offset: Offset(0, 5))
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "消息(${widget._msgList.length})",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 10),
                      ListView(
                          padding: EdgeInsets.zero,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          children: widget._msgList
                              .map((e) => getItemWidget(e))
                              .toList()),
                    ],
                  )),
              SizedBox(height: 30),
              getGHWidget(),
              SizedBox(height: 30)
            ],
          )),
    );
  }
}

Widget getGHWidget() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
    width: double.infinity,
    decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Color.fromARGB(180, 235, 235, 235),
              blurRadius: 10,
              offset: Offset(0, 1))
        ],
        borderRadius: BorderRadius.all(Radius.circular(15))),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("附近群组", style: TextStyle(fontSize: 20)),
        SizedBox(height: 15),
        StaggeredGrid.count(
          crossAxisCount: 3,
          mainAxisSpacing: 20,
          crossAxisSpacing: 24,
          children: [
            getGH_child_Widget(),
            getGH_child_Widget(),
            getGH_child_Widget()
          ],
        )
      ],
    ),
  );
}

Widget getGH_child_Widget() {
  return Container(
    height: 130,
    decoration: const BoxDecoration(
        color: Color.fromARGB(15, 158, 158, 158),
        borderRadius: BorderRadius.all(Radius.circular(8))),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: Image.asset(
            "assets/images/my.jpg",
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 5),
        Text("cheems")
      ],
    ),
  );
}

Widget getupdownWidget(String name, String svgUrl) {
  return Column(
    children: [
      SvgPicture.asset(svgUrl, color: Colors.grey),
      SizedBox(height: 5),
      Text(name, style: TextStyle(color: Colors.grey))
    ],
  );
}

Widget getupdownWidget1(String name, String svgUrl) {
  return Column(
    children: [
      SvgPicture.asset(svgUrl, color: Color.fromARGB(255, 29, 80, 255)),
      SizedBox(height: 5),
      Text(name, style: TextStyle(color: Colors.grey))
    ],
  );
}

Widget getItemWidget(MessageModel data) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              ClipOval(
                child: Image.asset(data.imgurl,
                    fit: BoxFit.cover, width: 40, height: 40),
              ),
              SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Text(data.name, style: TextStyle(fontSize: 16)),
                  Container(
                    width: 230,
                    child: Text(
                      data.body,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              )
            ],
          ),
          Column(
            children: [
              Text(data.creTime),
              Text("*"),
            ],
          )
        ],
      ),
      SizedBox(height: 13)
    ],
  );
}
