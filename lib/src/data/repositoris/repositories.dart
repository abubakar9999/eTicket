import 'dart:convert';
import 'dart:developer';

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
  createUser(Map<String, dynamic> body) async {
    log(jsonEncode(body), name: "repository body");
    String data = await ApiClient().postData2 (
        ApiUrls().userCreate(),
        body);
    return data;
  }

  Future<String> getUsers(int role) async {
    String data = await ApiClient().fetchData (
        ApiUrls().getUsers(role),
       );
    return data;
  }
 
  
}