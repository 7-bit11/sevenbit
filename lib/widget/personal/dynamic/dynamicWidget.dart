import 'package:sevenbit/utils/netUrl.dart';
import 'package:sevenbit/widget/image/ImageWidget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../model/personal_dynamicModel.dart';

class DynamicWidget extends StatefulWidget {
  const DynamicWidget(this.data, {super.key});
  final DynamicModel data;
  @override
  State<DynamicWidget> createState() => _DynamicPageState();
}

class _DynamicPageState extends State<DynamicWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        width: double.infinity,
        //height: 500,
        decoration: const BoxDecoration(
            color: Color.fromARGB(200, 245, 245, 245),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getBody(widget.data),
            const SizedBox(height: 10),
            Text(
              widget.data.tilteName,
              style: const TextStyle(fontSize: 17),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(widget.data.createtime,
                        style: const TextStyle(color: Colors.grey)),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: 50,
                      child: Text(
                        widget.data.address,
                        style: const TextStyle(color: Colors.grey),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    iconNumX(0, widget.data.eyenumber),
                    const SizedBox(width: 10),
                    iconNumX(1, widget.data.commentnumber)
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget getBody(DynamicModel dynamicModel) {
  Widget my;
  if (dynamicModel.imgdata.length == 1) {
    my = StaggeredGrid.count(
      crossAxisCount: 5,
      mainAxisSpacing: 13,
      crossAxisSpacing: 13,
      children: [
        StaggeredGridTile.count(
            crossAxisCellCount: 5,
            mainAxisCellCount: 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: MyCachedNetworkImage(
                "${netUrl.bitnetUrl}getImg/${dynamicModel.imgdata[0]}",
              ),
            )),
      ],
    );
  } else if (dynamicModel.imgdata.length == 2) {
    my = StaggeredGrid.count(
      crossAxisCount: 5,
      mainAxisSpacing: 13,
      crossAxisSpacing: 13,
      children: [
        StaggeredGridTile.count(
            crossAxisCellCount: 3,
            mainAxisCellCount: 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: MyCachedNetworkImage(
                "${netUrl.bitnetUrl}getImg/${dynamicModel.imgdata[0]}",
              ),
            )),
        StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: MyCachedNetworkImage(
                "${netUrl.bitnetUrl}getImg/${dynamicModel.imgdata[1]}",
              ),
            ))
      ],
    );
  } else {
    my = StaggeredGrid.count(
      crossAxisCount: 5,
      mainAxisSpacing: 13,
      crossAxisSpacing: 13,
      children: [
        StaggeredGridTile.count(
            crossAxisCellCount: 3,
            mainAxisCellCount: 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: MyCachedNetworkImage(
                "${netUrl.bitnetUrl}getImg/${dynamicModel.imgdata[0]}",
              ),
            )),
        StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1.5,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: MyCachedNetworkImage(
                "${netUrl.bitnetUrl}getImg/${dynamicModel.imgdata[1]}",
              ),
            )),
        StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1.5,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: MyCachedNetworkImage(
                "${netUrl.bitnetUrl}getImg/${dynamicModel.imgdata[2]}",
              ),
            )),
      ],
    );
  }
  return my;
}

Widget iconNumX(int type, int number) {
  return Row(
    children: [
      SvgPicture.asset(
        type == 0 ? "assets/svg/eye.svg" : "assets/svg/chat.svg",
        fit: BoxFit.none,
        color: Colors.grey,
      ),
      const SizedBox(width: 3),
      Text(
        "$number",
        style: const TextStyle(color: Colors.grey),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      )
    ],
  );
}
