import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget getNoDataWidget(double size) {
  return SizedBox(
    width: size,
    height: 300,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          "assets/svg/005.svg",
          fit: BoxFit.cover,
          width: double.infinity,
          height: 100,
        ),
        const Text(
          "暂无数据",
          style: TextStyle(fontSize: 16),
        )
      ],
    ),
  );
}
