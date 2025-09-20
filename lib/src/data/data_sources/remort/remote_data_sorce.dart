class GetDataFromAPi {

  //************** log in ******************* */

  // Future<User> logIn(Map<String, String> body) async {
  //   User userModel = await Repositories().login(body);
  //   log(jsonEncode(userModel), name: "User Model");
  //   return userModel;
  // }

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