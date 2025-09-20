class Repositories {



  ///********************  Log in  ***************** */
  // Future<User> login(Map<String, String> body) async {
  //   String url = await HiveOperation().getrestData(HiveBoxKeys.baseurl);
  //   log(url, name: "SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS");
  //   String data = await apiClient.login(
  //       ApiUrls().login(await HiveOperation().getrestData(HiveBoxKeys.baseurl)),
  //       body);
  //   // log("${jsonDecode(data)['restaurant_info']['currency_symbol']}", name: "currencyssssssssss");
  //   // await HiveOperation().addData(jsonDecode(data)['restaurant_info']['currency_symbol'], HiveBoxKeys.currency);
  //   log(jsonEncode(userFromJson(data)), name: "User Modelxxx");
  //   return userFromJson(data);
  // }

  // // ************************* Device Setup *************************
  // Future<Map<String, dynamic>> deviceSetup(Map<String, String> body) async {
  //   String url = await HiveOperation().getrestData(HiveBoxKeys.baseurl);
  //   log(url, name: "SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS");
  //   String data = await apiClient.DeviceSetUp(
  //       ApiUrls().deviceSetup(
  //           await HiveOperation().getrestData(HiveBoxKeys.baseurl)),
  //       body);
  //   return jsonDecode(data);
  // }
  
}