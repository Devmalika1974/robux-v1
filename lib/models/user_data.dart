import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  static const String _usernameKey = 'username';
  static const String _robuxAmountKey = 'robux_amount';
  
  String username;
  int robuxAmount;
  
  UserData({this.username = '', this.robuxAmount = 0});
  
  // Save user data to shared preferences
  Future<void> saveData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_usernameKey, username);
    await prefs.setInt(_robuxAmountKey, robuxAmount);
  }
  
  // Load user data from shared preferences
  static Future<UserData> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    return UserData(
      username: prefs.getString(_usernameKey) ?? '',
      robuxAmount: prefs.getInt(_robuxAmountKey) ?? 0,
    );
  }
  
  // Clear user data from shared preferences
  static Future<void> clearData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_usernameKey);
    await prefs.remove(_robuxAmountKey);
  }
}