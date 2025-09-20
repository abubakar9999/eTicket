import 'package:hive_flutter/hive_flutter.dart';

class HiveBoxesName {
  //********** Box Name *********** */
  static const String basicBox = 'BasicBox';
  static const String settingsBox = 'SettingsBox';
  static const String restbox = 'restbox';
  static const String tablebox = 'tablebox';
  static const String orderbox = 'orderbox';
  static const String secondScreenBox = 'secondScreenBox';
}

//********** open Box *********** */

class OpenBoxes {
  openBox() async {
    await Hive.openBox(HiveBoxesName.basicBox);
    // await Hive.openBox(HiveBoxesName.settingsBox);
    // await Hive.openBox(HiveBoxesName.restbox);
    // await Hive.openBox(HiveBoxesName.tablebox);
    // await Hive.openBox(HiveBoxesName.orderbox);
    // await Hive.openBox(HiveBoxesName.secondScreenBox);
  }
}

class HiveBoxes {
  static Box get basicBox => Hive.box(HiveBoxesName.basicBox);
  static Box get secondScreenBox => Hive.box(HiveBoxesName.secondScreenBox);
  static Box get allSettings => Hive.box(HiveBoxesName.settingsBox);
  static Box get restbox => Hive.box(HiveBoxesName.restbox);
  static Box get tablebox => Hive.box(HiveBoxesName.tablebox);
  static Box get orderbox => Hive.box(HiveBoxesName.orderbox);
}

class HiveBoxKeys {
  static const String baseurl = "baseurl";
  static const String userInfo = "userInfo";
  static const String isLogIn = "isLogIn";
  static const String isReg = "isLogIn";
  static const String currency = "currency";
  static const String allSettings = "allSettings";
  static const String isSecondaryConnected = "isSecondaryConnected";
  static const String isHideForPaymentScreen = "isHideForPaymentScreen";
  static const String currentSecondaryConnectedIndex = "currentSecondaryConnectedIndex";
  static const String fileDataKey = "fileData";
  static const String fileDataType = "fileDataType";
  static const String readyFoodCount = "readyFoodCount";
  static const String numberOfReadyFood = "number_of_ready_food";
  static const String allNewOrders = "allNewOrders";
  static const String deviceId = "deviceId";
  static const String cid = "cid";
  static const String branchID = "branchID";
  static const String isDeviceSetUP = "isDeviceSetUP";
  static const String tabledata = "allpabledata";
}
