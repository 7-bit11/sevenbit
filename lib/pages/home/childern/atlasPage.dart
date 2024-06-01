import 'package:bit_seven/model/home/atlasModel.dart';
import 'package:bit_seven/widget/home/atlasWidget.dart';
import 'package:bit_seven/widget/home/homeWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class AtlasPage extends StatefulWidget {
  const AtlasPage(this._list, {super.key});
  final List<AtlasModel> _list;
  @override
  State<AtlasPage> createState() => _AtlasPageState();
}

class _AtlasPageState extends State<AtlasPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BackgroundWidget(ListView(
        physics: const AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: StaggeredGrid.count(
              crossAxisCount: 3,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              axisDirection: AxisDirection.down,
              children: widget._list.map((e) => AtlasWidget(e)).toList(),
            ),
          ),
        ]));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
