import 'package:bit_seven/pages/LoginPage.dart';
import 'package:bit_seven/utils/overall_situation.dart';
import 'package:flukit/flukit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../frame.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late var _part = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: ListView(padding: EdgeInsets.zero, children: [
          Container(
            padding: const EdgeInsets.only(left: 30, right: 20, top: 100),
            child: Column(children: [
              Row(
                children: const [
                  Text(
                    "欢迎注册",
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(width: 5),
                  Text(
                    "seven_bit",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.blue,
                        fontWeight: FontWeight.w900),
                  )
                ],
              ),
              const SizedBox(height: 80),
              getMyTextFieldX("账号", "手机号/用户名/邮箱号"),
              const SizedBox(height: 30),
              getMyTextFieldX("密码", "请输入密码"),
              const SizedBox(height: 30),
              getMyTextFieldX("确认密码", "请输入密码"),
              const SizedBox(height: 50),
              //getMyTextFieldX("确认密码", "请输入密码"),
              getMyButtonWidget(() async {
                FocusScope.of(context).requestFocus(FocusNode());
                await EasyLoading.showToast('注册成功',
                    duration: const Duration(milliseconds: 1500));
                Get.back(result: "bit");
              }, "确认注册", 1, OverallSituation.typea),
              const SizedBox(height: 30),
              getMyButtonWidget(() {
                Get.back();
              }, "返回登录", 2, OverallSituation.typeb),
            ]),
          ),
        ]),
      ),
    );
  }
}

Widget getMyTextFieldX(String title, String textFieldStr) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: const TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
      ),
      TextField(
          decoration: InputDecoration(
        hintText: textFieldStr,
        hintStyle: const TextStyle(color: Colors.grey),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(167, 158, 158, 158)),
        ),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: OverallSituation.overallColor)),
      ))
    ],
  );
}

Widget getMyButtonWidget(
    Function() on, String buttonStr, int mtype, List<Color> type) {
  return Container(
    height: 48,
    width: double.infinity,
    decoration: BoxDecoration(
        color: mtype == 1 ? Colors.blue : Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(113))),
    child: GradientButton(
        disabledColor: Colors.red,
        colors: type,
        onPressed: on,
        borderRadius: const BorderRadius.all(Radius.circular(113)),
        child: Text(
          buttonStr,
          style: TextStyle(
              fontSize: 25, color: mtype == 1 ? Colors.white : Colors.grey),
        )),
  );
}
