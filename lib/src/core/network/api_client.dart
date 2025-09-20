import 'dart:convert';
import 'dart:developer';

import 'package:eticket/src/data/data_sources/local/local_data_sorce.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  Future<String> fetchData(String url) async {
    log("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx$url xxxx");
    // log("token === ${userFromJson(await HiveOperation().getData(HiveBoxKeys.userInfo)).token}");
    final response = await http.get(
      Uri.parse(url),
      // headers: {
      //   'Authorization': 'Bearer ${HiveOperation().getToken()}',
      // },
    );
    //log("&&&&&&&&&&&&&&&& ${response.statusCode}");
    log(response.body.toString(), name: 'Response');
    if (response.statusCode == 200) {
      return utf8.decode(response.bodyBytes);
    } else {
      return utf8.decode(response.bodyBytes);
    }
  }


  Future<String> postData(String url, Map<String, dynamic> data) async {
    log('post data api');
    log(url);
    log(data.toString(), name: "post body is");
    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode(data),
      headers: {
        // 'Authorization': 'Bearer ${HiveOperation().getToken()}',
        'Content-Type': 'application/json',
      },
    );

    log(response.statusCode.toString(), name: "status code");
    log(response.body.toString(), name: "posting data");

    if (response.statusCode == 200 || response.statusCode == 201) {
      // log(response.body);
      return utf8.decode(response.bodyBytes);
    } else {
      return utf8.decode(response.bodyBytes);
    }
  }
}
