import 'package:bit_seven/widget/personal/collection/collectionWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../model/personal_collectionModel.dart';

class CollectionPage extends StatefulWidget {
  const CollectionPage(this._collectionModelList, {super.key});
  final List<CollectionModel> _collectionModelList;
  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: widget._collectionModelList
            .map((e) => CollectionWidget(e))
            .toList(),
      ),
    );
  }
}
