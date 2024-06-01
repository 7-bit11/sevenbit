import 'package:sevenbit/model/personal_UserModel.dart';
import 'package:sevenbit/pages/user/dynmic/dynamicPage.dart';
import 'package:sevenbit/pages/user/dynmic/dynamicPageController.dart';
import 'package:sevenbit/pages/user/message/messagePage.dart';
import 'package:sevenbit/pages/user/message/messagePageController.dart';
import 'package:sevenbit/utils/overall_situation.dart';
import 'package:sevenbit/utils/service_result.dart';
import 'package:sevenbit/utils/servicebit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class UserDetailsPage extends StatefulWidget {
  const UserDetailsPage(this.userUrl, this.creDate, this.uaccount, {super.key});
  final String userUrl;
  final String creDate;
  final String uaccount;
  @override
  State<UserDetailsPage> createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage>
    with TickerProviderStateMixin {
  late List<Widget> body = [
    UserDynamicPage(widget.uaccount),
    UserMessagePage(widget.uaccount)
  ];
  late bool isgz = false;
  late TabController tabController = TabController(length: 2, vsync: this);
  late User user =
      User("", 0, "", "", DateTime(0), "", "", "", "", "", 0, 0, "", 0);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  void loadData() async {
    ServiceResultData data = await Service.getUserDetails(widget.uaccount);
    ServiceResultData data1 = await Service.getUserRelation(widget.uaccount);
    isgz = data1.data;
    user = data.data;
    setState(() {});
  }

  void uXGRelation() async {
    isgz = !isgz;
    ServiceResultData data = await Service.getXGRelation(widget.uaccount, isgz);
    if (data.success) {
      if (data.data) {
        if (isgz) {
          EasyLoading.showToast('已关注',
              duration: const Duration(milliseconds: 1500));
        } else {
          EasyLoading.showToast('取消关注',
              duration: const Duration(milliseconds: 1500));
        }
      }
    } else {
      EasyLoading.showToast('操作异常',
          duration: const Duration(milliseconds: 1500));
    }
    setState(() {});
  }

  Future<void> userDetailRefresh() async {
    loadData();
    if (tabController.index == 0) {
      UserDynamicPageController controller =
          Get.find<UserDynamicPageController>();
      controller.loadData();
    } else {
      UserMessagePageController controller =
          Get.find<UserMessagePageController>();
      controller.loadData();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Get.delete<UserDynamicPageController>();
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
      body: LiquidPullToRefresh(
        color: const Color.fromARGB(0, 255, 255, 255),
        backgroundColor: OverallSituation.typea[0],
        showChildOpacityTransition: false,
        springAnimationDurationInMilliseconds: 800,
        animSpeedFactor: 2.5,
        height: 80,
        onRefresh: userDetailRefresh,
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics(),
          ),
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
                        children: [
                          Text(
                            user.userName,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            user.introduce,
                            style: const TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                      Hero(
                        tag: widget.userUrl + widget.creDate,
                        child: ClipOval(
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
                                ? OverallSituation.typea
                                : OverallSituation.typeb,
                            onPressed: uXGRelation,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                            child: Text(
                              isgz ? "✔已关注" : "+关注",
                              style: TextStyle(
                                  fontSize: 17,
                                  color: isgz ? Colors.white : Colors.grey),
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
                        getItemuNuber(user.fwiNumber.toString(), "粉丝"),
                        getItemuNuber(user.vmfbsNumber.toString(), "关注"),
                        getItemuNuber(user.groupNumber.toString(), "群组")
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
                        labelStyle:
                            const TextStyle(fontWeight: FontWeight.bold),
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
