import 'package:sevenbit/utils/service_result.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class MyCachedNetworkImage extends StatelessWidget {
  MyCachedNetworkImage(this.imageUrl, {super.key, this.width, this.height});
  final String imageUrl;
  late double? width;
  late double? height;
  @override
  Widget build(BuildContext context) {
    Widget returnWidget = Container(
      color: Colors.red,
    );
    if (width != null && width! > 0) {
      returnWidget = CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        httpHeaders: ServiceTokenHead.headMap,
        width: width,
        height: height,
      );
    } else {
      returnWidget = CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        httpHeaders: ServiceTokenHead.headMap,
      );
    }

    return returnWidget;
  }
}
