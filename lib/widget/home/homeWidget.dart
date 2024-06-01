import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget(this.bodyWidget, {super.key});
  final Widget bodyWidget;
  @override
  Widget build(BuildContext context) {
    // BackdropFilter(
    //   filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
    return Container(
        padding: const EdgeInsets.only(left: 15, right: 15),
        decoration: const BoxDecoration(
            color: Color.fromARGB(245, 245, 245, 245),
            boxShadow: [
              BoxShadow(
                  color: Color.fromARGB(66, 121, 120, 120),
                  blurRadius: 100,
                  offset: Offset(0, 1))
            ],
            gradient: LinearGradient(
                //渐变位置
                begin: Alignment.topCenter,
                end: Alignment.center,
                stops: [
                  0.0,
                  1.0
                ], //[渐变起始点, 渐变结束点]
                //渐变颜色[始点颜色, 结束颜色]
                colors: [
                  Color.fromARGB(255, 255, 255, 255),
                  Color.fromARGB(245, 245, 245, 245)
                ])),
        child: bodyWidget);
  }
}
