import 'dart:io';

import 'package:sevenbit/pages/circle/circlePage.dart';

import 'package:sevenbit/utils/netUrl.dart';
import 'package:sevenbit/widget/image/ImageWidget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:palette_generator/palette_generator.dart';

import '../utils/service_result.dart';

class DynamicDetailPage extends StatelessWidget {
  const DynamicDetailPage(this.id, {super.key});
  final String id;

  Future<Color> getImageColor() async {
    ImageProvider imageProvider = NetworkImage(
        "${netUrl.bitnetUrl}getImg/21333333312432423423423423423423",
        headers: ServiceTokenHead.headMap);
    Color color = Colors.blue;
    try {
      PaletteGenerator paletteGenerator =
          await PaletteGenerator.fromImageProvider(imageProvider);
      print("paletteGenerator.dominantColor!.color");
      color = paletteGenerator.dominantColor!.color;
      print(paletteGenerator.dominantColor!.color);
    } catch (e) {
      print("eeeeeeeeeeeeeeeee");
      print(e);
    }
    return color;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        color: Color(0xff6fa4cd),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 0,
              pinned: true,
              floating: false,
              snap: false,
              expandedHeight: 300,
              actions: [
                GestureDetector(
                    onTapDown: (v) async {
                      await showRightMenu(
                          context, v.globalPosition.dx, v.globalPosition.dy,
                          items: [
                            const MapEntry("收藏", "sc"),
                            const MapEntry("关注", "gz")
                          ]);
                    },
                    child: AbsorbPointer(
                      child: IconButton(
                        onPressed: () {},
                        icon:
                            SvgPicture.asset("assets/svg/dots-horizontal.svg"),
                      ),
                    )),
                const SizedBox(width: 10)
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: MyCachedNetworkImage(
                      "${netUrl.bitnetUrl}getImg/b40e4d25-e515-48d4-aed8-91ede3bba5f3"),
                ),
              ),
            ),
            SliverList(delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  color: Colors.blue,
                  height: 1000,
                  child: Column(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        color: Colors.red,
                        child: TextButton(
                            onPressed: () async {
                              await getImageColor();
                            },
                            child: Text("点击")),
                      )
                    ],
                  ),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
