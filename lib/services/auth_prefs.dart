import 'package:shared_preferences/shared_preferences.dart';

class AuthPrefs {
  static const _hasSignedUpKey = 'has_signed_up';

  static Future<bool> hasSignedUp() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_hasSignedUpKey) ?? false;
  }

  static Future<void> markSignedUp() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_hasSignedUpKey, true);
  }
}
