import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkUtils {

  ///http get method
 static Future<dynamic> httpGetMethod(String url) async {
    final http.Response response = await http.get(Uri.parse(url));
    try {
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 401) {
        print('UnAuthorized');
      } else {
        print('Something went wrong');
      }
    } catch (e) {
      print(e);
    }
  }



 ///http post method
 static Future<dynamic> httpPostMethod(String url,{Map<String, String>? body}) async {
    final http.Response response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );
    try {
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 401) {
        print('UnAuthorized');
      } else {
        print('Something went wrong');
      }
    } catch (e) {
      print(e);
    }
  }


}
