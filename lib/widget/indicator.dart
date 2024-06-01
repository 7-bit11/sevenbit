import 'package:flutter/material.dart';

class Indicator extends Decoration {
  final Color color;
  const Indicator({this.color = Colors.red});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return IndicatorPainter(color);
  }
}

class IndicatorPainter extends BoxPainter {
  Color color;

  IndicatorPainter(this.color);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = 3.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    //创建形状
    final Rect rect = Rect.fromLTWH(
        0, 0, configuration.size!.width, configuration.size!.height);
    Offset toOffset = const Offset(14, 0);
    canvas.drawLine(rect.bottomLeft + offset + toOffset,
        rect.bottomRight + offset - toOffset, paint);
  }
}
