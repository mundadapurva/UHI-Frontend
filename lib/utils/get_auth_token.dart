import 'package:shared_preferences/shared_preferences.dart';

Future<String?> getAuthToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('accessToken');

  return token;
}

Future<String?> getUserID() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('id');

  return token;
}
