import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:bit_seven/model/personal_UserModel.dart';
import 'package:bit_seven/utils/service_result.dart';
import 'package:date_format/date_format.dart';
import 'package:file_picker/file_picker.dart';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:http/http.dart' as http;
import 'package:bit_seven/utils/netUrl.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user_dto.dart';

class Service {
  static Future<ServiceResultData> loginU(String name, String password) async {
    ServiceResultData serviceResult = ServiceResultData();
    var url = await http.post(Uri.parse("${netUrl.bitnetUrl}login.do"),
        body: {'userName': name, 'password': password});
    if (url.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(url.body);
      serviceResult = ServiceResultData.fromJson(data);
      if (serviceResult.success) {
        serviceResult.success = true;
        final shared = await SharedPreferences.getInstance();
        shared.setString("token", serviceResult.data);
        ServiceTokenHead.initializationHead(serviceResult.data);
        //SharedPer
      }
    }
    return serviceResult;
  }

  static Future<ServiceResultData> getUserDetails() async {
    ServiceResultData serviceResult = ServiceResultData();
    try {
      var url = await http.get(
          Uri.parse("${netUrl.bitnetUrl}user/getUserDetails.do"),
          headers: ServiceTokenHead.headMap);
      if (url.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(url.body);
        serviceResult = ServiceResultData.fromJson(data);
        if (serviceResult.success) {
          serviceResult.data = User.fromJson(serviceResult.data);
        }
      }
    } catch (e) {}
    return serviceResult;
  }

  static Future<ServiceResult> updateUserDetails(User user) async {
    UserDto userDto = UserDto(
        user.userName,
        user.userImgUrl,
        user.introduce,
        user.birthday.toString(),
        user.province,
        user.city,
        user.town,
        user.occupation,
        user.userSex);
    ServiceResult serviceResult = ServiceResult();
    Map s = userDto.toJson();
    try {
      var url = await http.post(
        Uri.parse("${netUrl.bitnetUrl}user/updateUserDetails.do"),
        headers: ServiceTokenHead.headMap,
        body: s,
      );
      if (url.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(url.body);
        serviceResult = ServiceResult.fromJson(data);
        if (serviceResult.success) {}
      }
    } catch (e) {
      print(e);
    }
    return serviceResult;
  }

  static Future<ServiceResult> uploadImage(
      PlatformFile file, Uint8List uint8list) async {
    List<int> data = uint8list;
    ServiceResult serviceResult = ServiceResult();
    var uri = Uri.parse("${netUrl.bitnetUrl}user/uploadImage.do");
    var request = http.MultipartRequest('POST', uri)
      ..files.add(
        http.MultipartFile.fromBytes(
          'package',
          data,
        ),
      );
    request.headers.addAll(ServiceTokenHead.headMap!);
    var response = await request.send();
    if (response.statusCode == 200) {
      Map<String, String> map = response.headers;
      serviceResult.success = true;
      serviceResult.msg = map["image"].toString();
    }
    return serviceResult;
  }
}
