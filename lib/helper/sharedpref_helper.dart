import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  static String userIdKey = "USERKEY";
  static String userNameKey = "USERNAMEKEY";
  static String displayNameKey = "USERDISPLAYNAMEKEY";
  static String userEmailKey = "USEREMAILKEY";
  static String userProfilePicKey = "USERPROFILEPICKEY";

  //save data
  Future<bool> saveUserName(String getUserName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userNameKey, getUserName);
  }

  Future<bool> saveUserEmail(String getUseremail) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userEmailKey, getUseremail);
  }

  Future<bool> saveUserId(String getUserId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userIdKey, getUserId);
  }

  Future<bool> saveDisplayName(String getDisplayName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(displayNameKey, getDisplayName);
  }

  Future<bool> saveUserProfileUrl(String getUserProfile) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userProfilePicKey, getUserProfile);
  }

  // get data
  Future<dynamic> getUserName() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      log('username ${prefs.getString(userNameKey)}');
      return prefs.getString(userNameKey)!;
    } catch (e) {
      log('getUserName $e');
    }
  }

  Future<dynamic> getUserEmail() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      log('getUserEmail ${prefs.getString(userEmailKey)}');

      return prefs.getString(userEmailKey)!;
    } catch (e) {
      log("getUserEmail $e");
    }
  }

  Future<dynamic> getUserId() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      log('getUserId ${prefs.getString(userIdKey)}');

      return prefs.getString(userIdKey)!;
    } catch (e) {
      log("getUserId $e");
    }
  }

  Future<dynamic> getDisplayName() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      log('getDisplayName ${prefs.getString(displayNameKey)}');

      return prefs.getString(displayNameKey)!;
    } catch (e) {
      log("getDisplayName $e");
    }
  }

  Future<dynamic> getUserProfileUrl() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      log('getUserProfileUrl ${prefs.getString(userProfilePicKey)}');

      return prefs.getString(userProfilePicKey)!;
    } catch (e) {
      log("getUserProfileUrl $e");
    }
  }
}
