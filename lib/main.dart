import 'package:sevenbit/utils/material_Color.dart';
import 'package:flutter/material.dart';
import 'package:sevenbit/pages/LoginPage.dart';
import 'package:sevenbit/utils/status_bar.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

void main() {
  StatusBar.setBarStatus(true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '7_bit',
      theme: ThemeData(
          fontFamily: "alimm",
          primarySwatch:
              createMaterialColor(const Color.fromARGB(0, 255, 255, 255)),
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent),
      home: LoginPage(),
      builder: EasyLoading.init(),
    );
  }
}
