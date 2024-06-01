import 'package:sevenbit/model/home/atlasModel.dart';
import 'package:flutter/cupertino.dart';

class AtlasWidget extends StatefulWidget {
  const AtlasWidget(this._atlasModel, {super.key});
  final AtlasModel _atlasModel;
  @override
  State<AtlasWidget> createState() => _AtlasWidgetState();
}

class _AtlasWidgetState extends State<AtlasWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              widget._atlasModel.imgUrl,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            widget._atlasModel.title,
            style: const TextStyle(fontSize: 18),
          )
        ],
      ),
    );
  }
}
