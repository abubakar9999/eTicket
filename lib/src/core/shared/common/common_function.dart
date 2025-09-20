import 'dart:io';

import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
class CommonFunction {
  Future<bool> hasInternetConnection() async {
    try {
      final connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.ethernet)) {
        final response = await head(Uri.parse('https://www.google.com'));
        return response.statusCode == 200;
      } else {
        return false;
      }
    } on SocketException {
      // Handle socket exceptions (e.g., device not connected to internet)
      return false;
    } on PlatformException {
      // Handle platform exceptions (e.g., network issues or permission problems)
      return false;
    } catch (e) {
      // Handle unexpected exceptions

      return false;
    }
  }
  
}