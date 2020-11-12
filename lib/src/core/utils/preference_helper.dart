import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHelper {
  PreferenceHelper._internal();

  static PreferenceHelper _instance;
  static SharedPreferences _preferences;

  static Future<PreferenceHelper> get instance async {
    if (_instance == null) {
      _instance = PreferenceHelper._internal();
    }

    if (_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
    }

    return _instance;
  }

  static const String languageKeyCode = 'languageCode';
  static const String countryKeyCode = 'countryCode';
  static String accessToken = "accessToken";
  static String refreshToken = "refreshToken";
  static String userId = "userId";
  static String phoneNumber = "phoneNumber";
  static String otpforNewUser = "otpforNewUser";
  static String appThemeMode = "appThemeMode";

  static const String sellAccessToken = "sellaccessToken";

  static String accessTemToken = "accessTemToken";
  static String memberAccessToken = "accessTemToken";
  static SharedPreferences prefs;

  static String sellerTokenDash = "sellerTokenDash";

  Future<void> setLanguageCode(String languageCode) async =>
      _preferences.setString(languageKeyCode, languageCode);

  Future<void> setCountryCode(String countryCode) async =>
      await _preferences.setString(countryKeyCode, countryCode);

  String get languageCode => _preferences.getString(languageKeyCode);
  String get countryCode => _preferences.getString(countryKeyCode);

//phone no
  Future<void> setPhoneNumber(String phoneNo) async =>
      _preferences.setString(phoneNumber, phoneNo);

  String get phoneNo => _preferences.getString(phoneNumber);

  // ..
  //otp no
  Future<void> setOtpForNewUser(bool value) async =>
      _preferences.setBool(otpforNewUser, value);

  bool get otpForNewUser => _preferences.getBool(otpforNewUser);

  //access Token
  static Future<String> getAccessToken() async {
    prefs = await SharedPreferences.getInstance();
    return prefs.getString(accessToken);
  }

  static setAccessToken(String value) async {
    prefs = await SharedPreferences.getInstance();
    await prefs.setString(accessToken, value);
  }

  Future<void> setDarkmode(bool isDarkMode) async =>
      await _preferences.setBool(appThemeMode, isDarkMode);

  bool get isDarkMode => _preferences.getBool(appThemeMode);

  //access Sell Token
  static setSellAccessToken(String value) async {
    prefs = await SharedPreferences.getInstance();
    await prefs.setString(sellAccessToken, value);
  }

  static Future<String> getSellAccessToken() async {
    prefs = await SharedPreferences.getInstance();
    return prefs.getString(sellAccessToken);
  }

  static Future<String> getTemToken() async {
    prefs = await SharedPreferences.getInstance();
    return prefs.getString(accessTemToken);
  }

  static setTemToken(String value) async {
    prefs = await SharedPreferences.getInstance();
    await prefs.setString(accessTemToken, value);
  }

  static setMemberAccessToken(String value) async {
    prefs = await SharedPreferences.getInstance();
    await prefs.setString(memberAccessToken, value);
  }

  static Future<String> getMemberToken() async {
    prefs = await SharedPreferences.getInstance();
    return prefs.getString(memberAccessToken);
  }
   static Future<String> getSellerTokenDash() async {
    prefs = await SharedPreferences.getInstance();
    return prefs.getString(sellerTokenDash);
  }

  static setSellerTokenDash(String value) async {
    prefs = await SharedPreferences.getInstance();
    await prefs.setString(sellerTokenDash, value);
  }

}
