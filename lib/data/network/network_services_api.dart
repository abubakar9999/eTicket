import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:eticket/data/exceptions/app_exceptions.dart';
import 'package:eticket/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkServicesApi implements BaseApiServices {
  @override
  Future<dynamic> PostApi(String url, data) async {
    dynamic jsonresponse;
    try {
      final response = await http.post(Uri.parse(url), body: data).timeout(const Duration(seconds: 50));

      jsonresponse = returnResponsce(response);
    } on SocketException {
      throw NoInternetException("");
    } on TimeoutException {
      throw FetchDataException('Time out try agin');
    }

    return jsonresponse;
  }

  @override
  Future deleteApi(String url) async {
    dynamic jsonresponse;
    try {
      final response = await http.delete(Uri.parse(url)).timeout(const Duration(seconds: 50));

      jsonresponse = returnResponsce(response);
    } on SocketException {
      throw NoInternetException("");
    } on TimeoutException {
      throw FetchDataException('Time out try agin');
    }

    return jsonresponse;
  }

  @override
  Future<dynamic> getApi(String url) async {
    dynamic jsonresponse;
    try {
      final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 50));

      jsonresponse = returnResponsce(response);
    } on SocketException {
      throw NoInternetException("");
    } on TimeoutException {
      throw FetchDataException('Time out try agin');
    }

    return jsonresponse;
  }

  dynamic returnResponsce(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic requestResponse = jsonDecode(response.body);
        return requestResponse;
      case 400:
        dynamic requestResponse = jsonDecode(response.body);
        return requestResponse;
      case 401:
        throw UnauthoriedException();
      case 500:
        throw FetchDataException('Error Communiting with server' + response.statusCode.toString());
    }
  }
}
