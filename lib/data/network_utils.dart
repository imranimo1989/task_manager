import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:task_manager/data/shared_preferece_data.dart';
import 'dart:developer';

import '../main.dart';
import '../ui/app_screen/LoginScreen.dart';

class NetworkUtils {
  ///http get method
  static Future<dynamic> httpGetMethod(String url,
      {VoidCallback? onUnAuthorised}) async {
    try {
      final http.Response response = await http.get(Uri.parse(url),
          headers: {
        "Content-Type": "application/json",
        "token": SharedPrefData.userToken!
      });
      log(response.body);
      if (response.statusCode == 200) {
        log(response.body);
        return jsonDecode(response.body);
      } else if (response.statusCode == 401) {
        if (onUnAuthorised != null) {
          onUnAuthorised();
        } else {
           ifUnAuthorised();
        }
      } else {
        log('Something went wrong');
      }
    } catch (e) {
      log("Error: $e");
    }
  }

  ///http post method
  static Future<dynamic> httpPostMethod(String url,
      {Map<String, String>? header,
      Map<String, String>? body,
      VoidCallback? onUnAuthorised}) async {
    try {
      final http.Response response = await http.post(
        Uri.parse(url),
        headers: header,
        body: jsonEncode(body),
      );
      log(response.body);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 401) {
        if (onUnAuthorised != null) {
          onUnAuthorised();
        } else {
          ifUnAuthorised();
        }
      } else {
        log('Something went wrong');
      }
    } catch (e) {
      log("Error: $e");
    }
  }

  static Future<void> ifUnAuthorised() async {
    await SharedPrefData.clearData();

    Navigator.pushAndRemoveUntil(
        Home.globalNavigatorKey.currentContext!,
        MaterialPageRoute(builder: (context) => const Login()),
        (route) => false);
  }

 static ShowBase64Image(Base64String){
    UriData? data= Uri.parse(Base64String).data;
    Uint8List MyImage= data!.contentAsBytes();
    return MyImage;
  }

}
