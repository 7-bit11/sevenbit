import 'package:sevenbit/pages/LoginPageController.dart';
import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../utils/overall_situation.dart';

class LoginPage extends GetView<LoginPageContorller> {
  @override
  Widget build(BuildContext context) {
    Get.put(LoginPageContorller());
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: ListView(
            padding: const EdgeInsets.only(left: 30, right: 20, top: 100),
            children: [
              Row(
                children: const [
                  Text(
                    "欢迎登录",
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
              getMyTextFieldX("账号", "手机号/用户名/邮箱号", controller.userName, 1),
              const SizedBox(height: 30),
              getMyTextFieldX("密码", "请输入密码", controller.password, 2),
              const SizedBox(height: 50),

              //getMyTextFieldX("确认密码", "请输入密码"),
              Obx(
                () => getMyButtonWidget(
                    controller.part.value ? controller.loginUser : null,
                    "登录",
                    1),
              ),
              const SizedBox(height: 30),
              getMyButtonWidget(() => controller.goRegisterPage(), "注册", 2),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("忘记密码",
                        style: TextStyle(fontSize: 18, color: Colors.grey)),
                    GestureDetector(
                      onTap: () {
                        controller.part.value = !controller.part.value;
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Obx(
                            () => SizedBox(
                              width: 25,
                              height: 25,
                              child: Checkbox(
                                  activeColor: OverallSituation.typea[0],
                                  checkColor: Colors.white,
                                  value: controller.part.value,
                                  onChanged: (value) {
                                    controller.part.value =
                                        !controller.part.value;
                                  },
                                  side: const BorderSide(
                                      color: Colors.grey, width: 1.3)),
                            ),
                          ),
                          const Text("隐私政策",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.grey))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ]),
      ),
    );
  }

  Widget getMyButtonWidget(Function()? on, String buttonStr, int mtype) {
    return Container(
      height: 48,
      width: double.infinity,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(113))),
      child: GradientButton(
          colors: mtype == 1 && on != null
              ? OverallSituation.typea
              : OverallSituation.typeb,
          onPressed: mtype == 1 && !controller.part.value
              ? () {
                  EasyLoading.showToast('登录需同意隐私政策',
                      duration: const Duration(milliseconds: 1500));
                }
              : on,
          borderRadius: const BorderRadius.all(Radius.circular(113)),
          child: Text(
            buttonStr,
            style: TextStyle(
                fontSize: 25,
                color: mtype == 1 && on != null ? Colors.white : Colors.grey),
          )),
    );
  }
}

Widget getMyTextFieldX(String title, String textFieldStr,
    TextEditingController controller, int x) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: const TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
      ),
      TextField(
        obscureText: x != 1 ? true : false,
        controller: controller,
        cursorColor: OverallSituation.overallColor,
        onChanged: (value) {},
        decoration: InputDecoration(
            hintText: textFieldStr,
            hintStyle: const TextStyle(color: Colors.grey),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(167, 158, 158, 158)),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: OverallSituation.overallColor),
            )),
      )
    ],
  );
}
