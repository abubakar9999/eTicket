import 'package:eticket/src/core/constants/api_urls.dart';
import 'package:eticket/src/core/network/api_client.dart';
import 'package:eticket/src/data/models/login_model.dart';

class Repositories {



  ///********************  Log in  ***************** */
  Future<User> login(Map<String, String> body) async {

    String data = await ApiClient().postData (
        ApiUrls().logIn(),
        body);
 

    // return userFromJson(data);
    return userFromJson(data);
  }

  //**********sub user login   */
  Future<User> subuserlogin(Map<String, String> body,int id) async {

    String data = await ApiClient().postData (
        ApiUrls().subuserLogIn(id),
        body);
 

    // return userFromJson(data);
    return userFromJson(data);
  }

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