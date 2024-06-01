import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../utils/overall_situation.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool isdelete = false;
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
        title: const Text("搜索"),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          color: Colors.red.withOpacity(0),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: GestureDetector(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              children: [
                Hero(
                  tag: "TextFieldss",
                  child: Container(
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(200, 243, 243, 243),
                              blurRadius: 10,
                              offset: Offset(10, 10))
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: TextField(
                        cursorColor: OverallSituation.overallColor,
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
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "历史搜索",
                      style: TextStyle(fontSize: 17),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isdelete = !isdelete;
                        });
                      },
                      child: SvgPicture.asset(
                        "assets/svg/trash.svg",
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                !isdelete
                    ? Wrap(
                        direction: Axis.horizontal,
                        spacing: 10,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        // crossAxisCount: 3,
                        // mainAxisSpacing: 15,
                        // crossAxisSpacing: 10,
                        children: [
                          getSearchHistoryItem("12321"),
                          getSearchHistoryItem("saas"),
                          getSearchHistoryItem("1"),
                          getSearchHistoryItem("3123123x"),
                          getSearchHistoryItem("21312312321321"),
                          getSearchHistoryItem("12321"),
                          getSearchHistoryItem("12321"),
                          getSearchHistoryItem("12321"),
                          getSearchHistoryItem("12322221"),
                          getSearchHistoryItem("12321"),
                          getSearchHistoryItem("12321"),
                        ],
                      )
                    : Container(
                        alignment: Alignment.topCenter,
                        child: const Text("暂无搜索历史...")),
                const SizedBox(height: 20),
                const Text(
                  "热门搜索",
                  style: TextStyle(fontSize: 17),
                ),
                const SizedBox(height: 10),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        width: double.infinity,
                        height: 60,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: 40,
                              child: Text(
                                (1 + index).toString(),
                                style: TextStyle(
                                    color: (1 + index) <= 3
                                        ? Colors.red
                                        : Colors.black,
                                    fontSize: 18),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text("测试测试测试测试测试测试"),
                                Text(
                                  "23232",
                                  style: TextStyle(color: Colors.grey),
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget getSearchHistoryItem(String a) {
  return Chip(
    label: Text(a),
    padding: EdgeInsets.symmetric(horizontal: 10),
    backgroundColor: Color.fromARGB(245, 245, 245, 245),
  );
}
