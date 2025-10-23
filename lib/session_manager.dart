import 'dart:convert';

import 'package:eticket/src/data/models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  final String auth_token = "auth_token";
  final String is_p = "is_p";
  final String is_login = "is_login";
  final String userInfo = "userinfo";


  Future<void> saveUseInfo (User user)async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Map<String, dynamic> user = {'Username':'tom','Password':'pass@123'};

    bool result = await prefs.setString('user', jsonEncode(user));
  }

  static Future<User> getUserInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userPref = prefs.getString('user');
    User userMap = User.fromJson(jsonDecode(userPref!));
    return userMap;
  }

//set data into shared preferences like this
  Future<void> setAuthToken(String auth_token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(this.auth_token, auth_token);
  }

//get value from shared preferences
  Future<String> getAuthToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString(this.auth_token) ?? null;
    return token!;
  }

  Future<void> setIsP(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(this.is_p, value);
  }

  static Future<bool> getIsP() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    bool? data = pref.getBool('is_p') ?? null;
    return data!;
  }
  //set data into shared preferences like this
  Future<void> setLogin(bool islogin) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(this.is_login, islogin);
  }


  //get value from shared preferences
  Future<bool> getLogin() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    bool? token = pref.getBool(this.is_login) ?? null;
    return token!;
  }


}