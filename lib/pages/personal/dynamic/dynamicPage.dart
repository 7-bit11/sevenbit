import 'package:bit_seven/widget/personal/dynamic/dynamicWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../../../model/personal_dynamicModel.dart';

class DynamicPage extends StatefulWidget {
  const DynamicPage(this._dynamicModelList, {super.key});
  final List<DynamicModel> _dynamicModelList;
  @override
  State<DynamicPage> createState() => _DynamicWidgetState();
}

class _DynamicWidgetState extends State<DynamicPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget._dynamicModelList.length,
        itemBuilder: (BuildContext context, int index) {
          return DynamicWidget(widget._dynamicModelList[index]);
        });
  }
}
