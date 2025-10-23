import 'package:hive_flutter/hive_flutter.dart';

class HiveBoxesName {
  //********** Box Name *********** */
  static const String basicBox = 'BasicBox';

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

}

class HiveBoxKeys {
  static const String tocken = 'Token';

}
