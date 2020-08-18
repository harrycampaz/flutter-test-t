import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tyga/features/user/domain/user.dart';

const String IS_LOGIN_KEY = "IS_LOGIN_KEY";
class UserRespository {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<bool> registerUser(User user) async{
    final SharedPreferences prefs = await _prefs;
    prefs.setBool(IS_LOGIN_KEY, true);
    return  prefs.setString(user.email, user.toJson().toString());

  }

  Future<bool> loginUser(String email, String password) async {
    final SharedPreferences prefs = await _prefs;

    // User user = prefs.getString(email);
    String data = prefs.getString(email);
    if(data == password){
      prefs.setBool(IS_LOGIN_KEY, true);
    }

    return prefs.getBool(IS_LOGIN_KEY) ?? false;
  }

  Future<bool> logoutUser(String email, String password) async {
    final SharedPreferences prefs = await _prefs;


    return prefs.setBool(IS_LOGIN_KEY, false);
  }

  Future<bool> isLoginUser() async {
    final SharedPreferences prefs = await _prefs;

    return prefs.getBool(IS_LOGIN_KEY) ?? false;
  }


}