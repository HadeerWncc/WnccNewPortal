import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveToken(String setName, String token) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(setName, token);
}

Future<String?> getToken() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('token');
}

Future<void> deleteToken() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('token');
}
