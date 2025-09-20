import 'dart:developer';


import 'package:eticket/src/core/constants/hive_constants.dart';

class HiveOperation {
  Future<void> addData(dynamic data, String key) async {
    await HiveBoxes.basicBox.put(key, data);
  }
  Future<void> add2ndScreenData(dynamic data, String key) async {
    await HiveBoxes.secondScreenBox.put(key, data);
  }

  Future<void> addrestData(dynamic data, String key) async {
    await HiveBoxes.restbox.put(key, data);
  }

  getData(String key) {
    return HiveBoxes.basicBox.get(key) ?? "";
  }
   get2ndScreenData(String key) {
     return HiveBoxes.secondScreenBox.get(key) ?? "";
   }
  getBooleanData(String key) {
    return HiveBoxes.basicBox.get(key) ?? false;
  }
  get2ndScreenBooleanData(String key) {
    return HiveBoxes.secondScreenBox.get(key) ?? false;
  }

  getrestData(String key) {
    return HiveBoxes.restbox.get(key) ?? "";
  }

  Future<void> addSettingsData(dynamic data, String key) async {
    await HiveBoxes.allSettings.put(key, data);
  }

  Future<String> getSettingsData(String key) async {
    return await HiveBoxes.allSettings.get(key) ?? "";
  }

}
