import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static SharedPreferences? pref;
  static LocalStorage? instance;

  // ************ constants ************
  static const userToken = "token";
  static const appLanguage = "currentLang";
  static const firebaseToken = "firebase_token";
  static const themeMode = 'theme_mode';

  // ************ init class ************
  Future<SharedPreferences> get shared async {
    pref ??= await SharedPreferences.getInstance();
    return pref!;
  }

  static LocalStorage getInstance() {
    instance ??= LocalStorage();
    return instance!;
  }

  // ************ functions ************
  Future<bool> saveLanguage(String lan) async {
    var cache = await shared;
    cache.setString(appLanguage, lan);
    return true;
  }

  String getLanguage() {
    String? value = pref?.getString(appLanguage);
    if (value == null || value.isEmpty) return "ru";
    return value;
  }

  // -----------------------------------
  void saveUserToken(String token) async {
    var cache = await shared;
    cache.setString(userToken, token);
  }

  Future<String> getUserToken() async {
    var prefs = await shared;
    return prefs.getString(userToken) ?? "";
  }

  // -----------------------------------
  void setBrightness(Brightness brightness) async {
    var prefs = await shared;
    brightness == Brightness.dark
        ? prefs.setBool("isDark", true)
        : prefs.setBool("isDark", false);
  }

  Future<Brightness> getBrightness() async {
    var prefs = await shared;
    var brightness = prefs.getBool("isDark");
    if (brightness == null || brightness == false) {
      return Brightness.light;
    } else {
      return Brightness.dark;
    }
  }
  // -----------------------------------

  Future<bool> saveFirebaseToken(String token) async {
    var cache = await shared;
    cache.setString(firebaseToken, token);
    return true;
  }

  Future<String> getFirebaseToken() async {
    var prefs = await shared;
    String? value = prefs.getString(firebaseToken);
    if (value == null || value.isEmpty) return "";
    return value;
  }
  // -----------------------------------

  setCurrentTheme(String themeText) async {
    var cache = await shared;
    cache.setString(themeMode, themeText);
  }

  String getCurrentTheme() {
    return pref!.getString(themeMode) ?? "light";
  }
}
