import 'package:eticket/src/data/models/login_model.dart';
import 'package:eticket/src/data/repositoris/repositories.dart';

class GetDataFromAPi {

  //************** log in ******************* */

  Future<User> logIn(Map<String, String> body) async {
    User userModel = await Repositories().login(body);
    
    return userModel;
  }

  // //******************* branch urse ******************* */
  // Future<List<String>> branchUserList() async {
  //   BranchUsers allusers = await Repositories().userList();

  //   log(jsonEncode(allusers), name: "All users");
  //   if (allusers.status == "Success") {
  //     return allusers.userList!;
  //   } else {
  //     return [];
  //   }
  // }

  // //******************* Settings ******************* */
  // Future<bool> settingData() async {
  //   AllSettings allSettings = await Repositories().allSettingData();

  //   log(jsonEncode(allSettings), name: "All Settings");
  //   if (allSettings.status == "Success") {
  //     await HiveOperation().addSettingsData(allSettingsToJson(allSettings), HiveBoxKeys.allSettings);
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }
  
}