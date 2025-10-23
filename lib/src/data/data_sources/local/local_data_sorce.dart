import 'dart:developer';


import 'package:eticket/src/core/constants/hive_constants.dart';

class HiveOperation {
  Future<void> addData(dynamic data, String key) async {
    await HiveBoxes.basicBox.put(key, data);
  }


  getData(String key) {
    return HiveBoxes.basicBox.get(key) ?? "";
  }
  

  


}
