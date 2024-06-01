import 'package:bit_seven/model/home/everydayModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';

class EverydayWidget extends StatefulWidget {
  const EverydayWidget(this._everydayModel, {super.key});
  final EverydayModel _everydayModel;
  @override
  State<EverydayWidget> createState() => _EverydayWidgetState();
}

class _EverydayWidgetState extends State<EverydayWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 10),
      child: Container(
        height: 255,
        width: double.infinity,
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.all(Radius.circular(12))),
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    widget._everydayModel.imgUrl,
                    alignment: Alignment.topCenter,
                    width: double.infinity,
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                  SvgPicture.asset("assets/svg/play.svg",
                      width: 40, color: Colors.white),
                  Positioned(
                      bottom: 10,
                      left: 10,
                      child: Text(
                        widget._everydayModel.videoTime,
                        style: const TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              blurRadius: 10,
                              color: Color.fromARGB(125, 0, 0, 0),
                            ),
                          ],
                        ),
                      )),
                  Positioned(
                      bottom: 10,
                      right: 5,
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/svg/eye.svg",
                            color: const Color.fromARGB(96, 0, 0, 0),
                          ),
                          const SizedBox(width: 3),
                          Text(
                            widget._everydayModel.lookNumber.toString(),
                            style: const TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                  blurRadius: 10,
                                  color: Color.fromARGB(125, 0, 0, 0),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            ),
            const SizedBox(height: 5),
            Text(
              widget._everydayModel.title,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                const SizedBox(width: 3),
                Row(
                  children: [
                    SvgPicture.asset("assets/svg/star.svg",
                        fit: BoxFit.cover,
                        width: 20,
                        color: const Color.fromARGB(87, 75, 53, 53)),
                    const SizedBox(width: 3),
                    Text(
                      widget._everydayModel.stareNumber.toString(),
                      style: const TextStyle(
                          color: Color.fromARGB(87, 75, 53, 53)),
                    )
                  ],
                ),
                const SizedBox(width: 20),
                Row(
                  children: [
                    SvgPicture.asset("assets/svg/chat.svg",
                        width: 20, color: const Color.fromARGB(87, 75, 53, 53)),
                    const SizedBox(width: 3),
                    Text(
                      widget._everydayModel.personNumber.toString(),
                      style: const TextStyle(
                          color: Color.fromARGB(87, 75, 53, 53)),
                    )
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
