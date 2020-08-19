import 'dart:async';

import 'package:erp/util/preferences/preferences_helper.dart';

import 'package:erp/util/const.dart';


class Prefs {


  static Future<String> get username =>
      PreferencesHelper.getString(Const.KEY_LAST_LOG_UN);

  static Future<String> get password =>
      PreferencesHelper.getString(Const.KEY_LAST_LOG_PW);

  static Future<String> get token =>
      PreferencesHelper.getString(Const.KEY_LAST_LOG_TOKEN);

  static Future<String> get logdate =>
      PreferencesHelper.getString(Const.KEY_LAST_LOG_DATE);

  static Future setUsername(String value) =>
      PreferencesHelper.setString(Const.KEY_LAST_LOG_UN, value);

  static Future setPassword(String value) =>
      PreferencesHelper.setString(Const.KEY_LAST_LOG_PW, value);

  static Future setToken(String value) =>
      PreferencesHelper.setString(Const.KEY_LAST_LOG_TOKEN, value);

  static Future setLogdate(String value) =>
      PreferencesHelper.setString(Const.KEY_LAST_LOG_DATE, value);

  static Future<void> clear() async {
    await Future.wait(<Future>[
      setUsername(''),
      setPassword(''),
      setToken(''),
      setLogdate(''),
    ]);
  }

}

