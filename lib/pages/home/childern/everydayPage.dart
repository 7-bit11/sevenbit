import 'dart:ui';

import 'package:bit_seven/widget/home/everydayWidget.dart';
import 'package:bit_seven/widget/home/homeWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../model/home/everydayModel.dart';

class EverydayPage extends StatefulWidget {
  const EverydayPage(this._everydayModelList, {super.key});
  final List<EverydayModel> _everydayModelList;
  @override
  State<EverydayPage> createState() => _EverydayPageState();
}

class _EverydayPageState extends State<EverydayPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(ListView(
      physics: const BouncingScrollPhysics(),
      children:
          widget._everydayModelList.map((e) => EverydayWidget(e)).toList(),
    ));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
