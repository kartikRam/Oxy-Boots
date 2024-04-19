
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  final String _usernameKey = 'username';
  final String _passwordKey = 'password';
  final String _isLoggedInKey = 'isLoggedIn';

  Future<void> signUp(String username, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_usernameKey, username);
    await prefs.setString(_passwordKey, password);
    await prefs.setBool(_isLoggedInKey, true);
  }

  Future<bool> login(String username, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedUsername = prefs.getString(_usernameKey);
    String? savedPassword = prefs.getString(_passwordKey);

    if (savedUsername != null && savedPassword != null &&
        username == savedUsername && password == savedPassword) {
      await prefs.setBool(_isLoggedInKey, true);
      return true;
    }

    return false;
  }


  Future<bool> isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isLoggedInKey) ?? false;
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_usernameKey);
    await prefs.remove(_passwordKey);
    await prefs.setBool(_isLoggedInKey, false);
  }
}
