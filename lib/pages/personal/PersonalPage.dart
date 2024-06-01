import 'package:sevenbit/pages/LoginPage.dart';
import 'package:sevenbit/pages/personal/collection/collectionPage.dart';
import 'package:sevenbit/pages/personal/details/detailsPage.dart';
import 'package:sevenbit/pages/personal/dynamic/dynamicPage.dart';
import 'package:sevenbit/pages/personal/message/messagePage.dart';
import 'package:sevenbit/pages/personal/personalPageController.dart';
import 'package:sevenbit/utils/overall_situation.dart';
import 'package:sevenbit/utils/service_result.dart';
import 'package:sevenbit/widget/noDataWidget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sevenbit/utils/netUrl.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class PersonalPage extends GetView<PersonalPageController> {
  late final List<Widget> body = [
    DynamicPage(),
    const CollectionPage(),
    const MessagePage()
  ];
  @override
  Widget build(BuildContext context) {
    Get.put(PersonalPageController());

    final size = MediaQuery.of(context).size;
    return Obx(() => !controller.isinit.value
        ? Center(child: getNoDataWidget(size.width / 2 - 50))
        : Scaffold(
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
                                  color:
                                      const Color.fromARGB(255, 245, 245, 245),
                                  borderRadius: BorderRadius.circular(20)),
                              height: 200,
                              width: 250,
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox(
                                    height: 25,
                                    child: Text(
                                      "c退出登录",
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
                                              fontSize: 16,
                                              color: Colors.white),
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
            body: LiquidPullToRefresh(
              color: const Color.fromARGB(0, 255, 255, 255),
              backgroundColor: OverallSituation.typea[0],
              showChildOpacityTransition: false,
              springAnimationDurationInMilliseconds: 800,
              onRefresh: controller.onRefresh,
              animSpeedFactor: 2.5,
              height: 80,
              child:
                  ListView(physics: const BouncingScrollPhysics(), children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(100, 245, 245, 245),
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    height: 240,
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
                                Column(children: [
                                  Text(controller.user.fwiNumber.toString(),
                                      style: const TextStyle(fontSize: 18)),
                                  const Text("粉丝",
                                      style: TextStyle(color: Colors.grey))
                                ]),
                                Column(children: [
                                  Text(controller.user.vmfbsNumber.toString(),
                                      style: const TextStyle(fontSize: 18)),
                                  const Text("关注",
                                      style: TextStyle(color: Colors.grey))
                                ]),
                                Column(children: [
                                  Text(controller.user.groupNumber.toString(),
                                      style: const TextStyle(fontSize: 18)),
                                  const Text("群组",
                                      style: TextStyle(color: Colors.grey))
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          child: Obx(
                            () => Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    await Get.to(DetailsPage(controller.user),
                                        transition: Transition.rightToLeft);
                                    controller.loadData();
                                  },
                                  child: Hero(
                                    tag:
                                        "${netUrl.bitnetUrl}getImg/${controller.ux.value.userImgUrl}",
                                    child: ClipOval(
                                      child: CachedNetworkImage(
                                        fit: BoxFit.cover,
                                        width: 80,
                                        height: 80,
                                        httpHeaders: ServiceTokenHead.headMap,
                                        imageUrl:
                                            "${netUrl.bitnetUrl}getImg/${controller.ux.value.userImgUrl}",
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
                                Text(controller.ux.value.userName,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500)),
                                Text(controller.ux.value.introduce)
                              ],
                            ),
                          ))
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
                        color: Color.fromARGB(100, 242, 242, 242),
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.indexNum.value = 0;
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset("assets/svg/home.svg",
                                  color: controller.indexNum.value == 0
                                      ? const Color.fromARGB(255, 29, 80, 255)
                                      : Colors.grey),
                              const SizedBox(width: 3),
                              Text("动态",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: controller.indexNum.value == 0
                                          ? const Color.fromARGB(
                                              255, 29, 80, 255)
                                          : Colors.grey))
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.indexNum.value = 1;
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset("assets/svg/annotation.svg",
                                  color: controller.indexNum.value == 1
                                      ? const Color.fromARGB(255, 29, 80, 255)
                                      : Colors.grey),
                              const SizedBox(width: 3),
                              Text("收藏",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: controller.indexNum.value == 1
                                          ? const Color.fromARGB(
                                              255, 29, 80, 255)
                                          : Colors.grey))
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.indexNum.value = 2;
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset("assets/svg/chat_alt.svg",
                                  color: controller.indexNum.value == 2
                                      ? const Color.fromARGB(255, 29, 80, 255)
                                      : Colors.grey),
                              const SizedBox(width: 3),
                              Text("消息",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: controller.indexNum.value == 2
                                          ? const Color.fromARGB(
                                              255, 29, 80, 255)
                                          : Colors.grey))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
                    child: body[controller.indexNum.value])
              ]),
            ),
          ));
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
