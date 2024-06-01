import 'package:sevenbit/widget/home/everydayWidget.dart';
import 'package:sevenbit/widget/home/homeWidget.dart';
import 'package:flutter/material.dart';

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
