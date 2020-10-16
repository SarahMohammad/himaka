import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

saveLoginData(String user) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('UserData', user);
}



saveDeviceToken(String token) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('FCMToken', token);
}

onBoard() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool('on_board_screen', true);
}


//Future<int> isFirstTime() async {
//  var prefs = await SharedPreferences.getInstance();
//  if (prefs.getBool('on_board_screen') != null) {
//    String user = prefs.get('UserData') ?? null;
//    if (user != null) {
//      Globals.userData = UserData.fromJson(json.decode(user));
//      return 2;
//    }
//    return 3;
//  }
//  return 1;
//}

Future<String> fetchFCMToken() async {
  var prefs = await SharedPreferences.getInstance();
  String token = prefs.getString('FCMToken');
  if (token != null) {
    return token;
  }
  return '';
}

Future<bool> removeUserData() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.remove('UserData');
  return true;
}
