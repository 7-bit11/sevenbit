import 'package:sevenbit/pages/personal/details/detailsPageController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsWidget extends StatefulWidget {
  const DetailsWidget(this.myWidget, this.title, this.indo, {super.key});
  final Widget myWidget;
  final String title;
  final Function() indo;
  @override
  State<DetailsWidget> createState() => _DetailsWidgetState();
}

class _DetailsWidgetState extends State<DetailsWidget> {
  @override
  Widget build(BuildContext context) {
    // final DetailsPageController detailsPageController = Get.find();
    return GestureDetector(
      onTap: widget.indo,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Container(
          decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(18, 158, 158, 158),
                    blurRadius: 15,
                    offset: Offset(0, 15))
              ],
              color: Color.fromARGB(255, 250, 250, 250),
              borderRadius: BorderRadius.all(Radius.circular(12))),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              widget.myWidget
            ],
          ),
        ),
      ),
    );
  }
}
