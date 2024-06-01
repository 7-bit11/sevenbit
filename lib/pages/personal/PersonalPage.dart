import 'package:bit_seven/model/personal_collectionModel.dart';
import 'package:bit_seven/model/personal_messageModel.dart';
import 'package:bit_seven/pages/LoginPage.dart';
import 'package:bit_seven/pages/personal/collection/collectionPage.dart';
import 'package:bit_seven/pages/personal/details/detailsPage.dart';
import 'package:bit_seven/pages/personal/message/messagePage.dart';
import 'package:bit_seven/utils/overall_situation.dart';
import 'package:bit_seven/utils/servicebit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flukit/flukit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:bit_seven/utils/netUrl.dart';
import '../../model/personal_UserModel.dart';
import '../../model/personal_dynamicModel.dart';
import '../../utils/service_result.dart';
import '../../widget/personal/dynamic/dynamicWidget.dart';
import 'dynamic/dynamicPage.dart';

class PersonalPage extends StatefulWidget {
  const PersonalPage({super.key});

  @override
  State<PersonalPage> createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  late List<DynamicModel> mydata;
  late List<MessageModel> _msgList;
  late final List<Widget> body;
  late List<CollectionModel> _collectionlist;
  late int indexNum;
  User? _user;
  late bool isBool = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    indexNum = 0;
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

    _collectionlist = [
      CollectionModel(
          "2021年5月18日", "我的第一次vlog", "8:04", "assets/images/87469375_p0.png"),
      CollectionModel("2077年7月7日", "赛博朋克的世界终于成为现实", "20:77",
          "assets/images/81546410_p0.jpg"),
      CollectionModel("2022年12月11日", "马上就要过年了，放个炮", "0:10",
          "assets/images/85670805_p0.jpg"),
      CollectionModel(
          "2023年2月14日", "这年过的太快了吧，怎么就上班了", "1:13", "assets/images/user.webp")
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
    body = [
      DynamicPage(mydata),
      CollectionPage(_collectionlist),
      MessagePage(_msgList)
    ];
    loadData();
  }

  void loadData() async {
    ServiceResultData data = await Service.getUserDetails();
    _user = data.data;
    setState(() {});
  }

  Future<void> _onRefresh() async {
    //模拟网络请求
    await Future.delayed(const Duration(milliseconds: 2000));
    //结束刷新
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(0, 255, 255, 255),
        actions: [
          IconButton(
            onPressed: () {
              showGeneralDialog(
                  barrierColor: Colors.grey.withOpacity(0.7),
                  context: context,
                  barrierDismissible: true,
                  barrierLabel: '',
                  transitionDuration: const Duration(milliseconds: 200),
                  pageBuilder: (BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation) {
                    return Center(
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(245, 245, 245, 245),
                            borderRadius: BorderRadius.circular(20)),
                        height: 200,
                        width: 250,
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(
                              height: 25,
                              child: Text(
                                "退出登录",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: GradientButton(
                                  colors: OverallSituation.typea,
                                  onPressed: () {
                                    Get.offAll(() => LoginPage(),
                                        transition: Transition.downToUp);
                                  },
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  child: const Text(
                                    "确认",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  )),
                            )
                          ],
                        ),
                      ),
                    );
                  });
            },
            icon: SvgPicture.asset(
              "assets/svg/external-link.svg",
            ),
          ),
        ],
        leading: SvgPicture.asset(
          "assets/svg/cog.svg",
          fit: BoxFit.none,
        ),
      ),
      body: RefreshIndicator(
        color: const Color.fromARGB(255, 29, 80, 255),
        onRefresh: _onRefresh,
        displacement: 0,
        child: ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(100, 245, 245, 245),
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  height: 230,
                  width: double.infinity,
                  child: Stack(children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 13),
                      width: double.infinity,
                      height: 230,
                      //color: Colors.red,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(children: const [
                                Text("83", style: TextStyle(fontSize: 18)),
                                Text("粉丝", style: TextStyle(color: Colors.grey))
                              ]),
                              Column(children: const [
                                Text("180", style: TextStyle(fontSize: 18)),
                                Text("关注", style: TextStyle(color: Colors.grey))
                              ]),
                              Column(children: const [
                                Text("12", style: TextStyle(fontSize: 18)),
                                Text("群组", style: TextStyle(color: Colors.grey))
                              ])
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 150,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromARGB(20, 158, 158, 158),
                                blurRadius: 100,
                                offset: Offset(0, 1))
                          ],
                          color: Color.fromARGB(255, 250, 250, 250),
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              await Get.to(DetailsPage(_user!),
                                  transition: Transition.rightToLeft);
                              loadData();
                            },
                            child: Hero(
                              tag:
                                  "${netUrl.bitnetUrl}getImg/${_user?.userImgUrl}",
                              child: ClipOval(
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  width: 80,
                                  height: 80,
                                  imageUrl: _user?.userImgUrl != null
                                      ? "${netUrl.bitnetUrl}getImg/${_user?.userImgUrl}"
                                      : "${netUrl.bitnetUrl}getImg/0000001",
                                  errorWidget: (context, url, error) {
                                    return Image.asset(
                                      "assets/images/yt.jpg",
                                      width: 80,
                                      height: 80,
                                      fit: BoxFit.cover,
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(_user?.userName ?? "",
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500)),
                          Text(_user?.introduce ?? "")
                        ],
                      ),
                    )
                  ]),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: double.infinity,
                  height: 40,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(100, 245, 245, 245),
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            indexNum = 0;
                          });
                        },
                        child: SvgPicture.asset("assets/svg/home.svg",
                            color: indexNum == 0
                                ? const Color.fromARGB(255, 29, 80, 255)
                                : Colors.grey),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            indexNum = 1;
                          });
                        },
                        child: SvgPicture.asset("assets/svg/annotation.svg",
                            color: indexNum == 1
                                ? const Color.fromARGB(255, 29, 80, 255)
                                : Colors.grey),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            indexNum = 2;
                          });
                        },
                        child: SvgPicture.asset("assets/svg/chat_alt.svg",
                            color: indexNum == 2
                                ? const Color.fromARGB(255, 29, 80, 255)
                                : Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: body[indexNum],
              )
            ]),
      ),
    );
  }
}

Widget iconNumX(int type, int number) {
  return Row(
    children: [
      SvgPicture.asset(
        type == 0 ? "assets/svg/eye.svg" : "assets/svg/chat.svg",
        fit: BoxFit.none,
        color: Colors.grey,
      ),
      const SizedBox(width: 3),
      Text(
        "$number",
        style: const TextStyle(color: Colors.grey),
      )
    ],
  );
}
