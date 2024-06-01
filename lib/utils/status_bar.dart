import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StatusBar {
  static setBarStatus(bool isDarkIcon, {Color color = Colors.transparent}) async {
    if (Platform.isAndroid || Platform.isIOS) {
      SystemUiOverlayStyle? systemUiOverlayStyle = getSystemUiOverlayStyle(isDarkIcon);
      if (systemUiOverlayStyle != null) {
        SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
      }
    }
  }

  static SystemUiOverlayStyle? getSystemUiOverlayStyle(bool isDarkIcon, {Color color = Colors.transparent}) {
    if (Platform.isAndroid || Platform.isIOS) {
      if (isDarkIcon) {
        return SystemUiOverlayStyle(
          statusBarColor: color,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
          systemNavigationBarColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.light,
          systemNavigationBarContrastEnforced: false,
        );
      } else {
        return SystemUiOverlayStyle(
          statusBarColor: color,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark,
          systemNavigationBarContrastEnforced: false,
        );
      }
    }
    return null;
  }
}
