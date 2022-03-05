import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  static String userID = "USERKEY";
  static String username = "USERNAMEKEY";
  static String displayname = "USERDISPLAYNAMEKEY";
  static String useremail = "USEREMAILKEY";
  static String userprofile = "USERPROFILEKEY";

  //restore data

  Future<bool> saveUsername(String? getusername) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(username, getusername!);
  }

  Future<bool> saveUserEmail(String? getuseremail) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(useremail, getuseremail!);
  }

  Future<bool> saveUserId(String? getuserId) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(userID, getuserId!);
  }

  Future<bool> saveUserProfile(String? getuserProfile) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(userprofile, getuserProfile!);
  }

  Future<bool> saveUserDisplayName(String? getuserDisplayName) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(displayname, getuserDisplayName!);
  }

  //get data restored

 Future<String?> getUserName() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
   return sharedPreferences.getString(username);
  }
  
   Future<String?> getUserEmail() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
   return sharedPreferences.getString(useremail);
  }
  
   Future<String?> getUserID() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
   return sharedPreferences.getString(userID);
  }
   
   Future<String?> getUserProfile() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
   return sharedPreferences.getString(userprofile);
  }
  
   Future<String?> getUserDisplayName() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
   return sharedPreferences.getString(displayname);
  }
}
