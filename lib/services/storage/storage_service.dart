import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  Future<void> setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", token);
  }

  Future<String> getToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.containsKey('token')) {
      return preferences.getString('token');
    } else {
      return null;
    }
  }
}
