import 'dart:io';

import 'package:flutter_tanya_mama/constants/font_size.dart';
import 'package:flutter_tanya_mama/functions/enum_parser.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'shared_preferences_function.dart';

class TokenVersion {
  final SharedPreferencesFunction _sharedPreferencesHelper =
      SharedPreferencesFunction();

  String? _token;
  String? _os;
  String? _version;
  FontSize _fontSize = FontSize.medium;

  static init() async {
    String? fontSize =
        await instance._sharedPreferencesHelper.getValue('fontSize');

    if (fontSize == null) {
      fontSize = EnumParser.getString(FontSize.medium);
      instance._sharedPreferencesHelper.setStringValue('fontSize', fontSize);
    }
    instance._fontSize = EnumParser.getEnum(FontSize.values, fontSize);
  }

  static double getFontSizeMapping() {
    switch (instance._fontSize) {
      case FontSize.small:
        return 0;
      case FontSize.medium:
        return 1;
      case FontSize.large:
        return 2;
      case FontSize.xlarge:
        return 3;
    }
  }

  static double getFontRatio() {
    switch (instance._fontSize) {
      case FontSize.small:
        return 0.8;
      case FontSize.medium:
        return 1;
      case FontSize.large:
        return 1.2;
      case FontSize.xlarge:
        return 1.4;
    }
  }

  static setFontSizeByMapping(double mapping) async {
    var fontSize = FontSize.values[mapping.toInt()];
    await instance._sharedPreferencesHelper
        .setStringValue('fontSize', EnumParser.getString(fontSize));
    instance._fontSize = fontSize;
  }

  static TokenVersion? _instance;

  static TokenVersion get instance {
    return _instance ?? (_instance = TokenVersion());
  }

  static Future<String> getVersion() async {
    if (instance._version == null) {
      var packageInfo = await PackageInfo.fromPlatform();
      instance._version = packageInfo.version;
    }
    return instance._version ?? "";
  }

  static Future<String?> getOS() async {
    instance._os ??= Platform.isIOS ? "iOS" : "Android";
    return instance._os;
  }

  static Future<String> getVersionString() async {
    var os = await getOS();
    var version = await getVersion();
    return "vers. $os $version";
  }

  static Future<String> getToken() async {
    instance._token ??=
        await instance._sharedPreferencesHelper.getValue('token');
    return instance._token ?? "";
  }

  // static Future<User> getUser() async {
  //   if (instance._user == null) {
  //     var userString = await instance._sharedPreferencesHelper.getValue('user');
  //     Map<String, dynamic> userMap = jsonDecode(userString!);
  //     instance._user = User.fromMap(userMap);
  //   }
  //   return instance._user!;
  // }

  // static Future<String?> getUserId() async {
  //   var user = await getUser();
  //   return user.id;
  // }

  static Future<void> setToken(String token) async {
    await instance._sharedPreferencesHelper.setStringValue('token', token);

    instance._token = token;
  }

  // static Future<void> setUser(User user) async {
  //   var userVariables = user.toVariables();
  //   var userString = jsonEncode(userVariables);
  //   await instance._sharedPreferencesHelper.setStringValue('user', userString);

  //   instance._user = user;
  // }

  // static Future<void> setUserId(String userId) async {
  //   await instance._sharedPreferencesHelper.setStringValue('userId', userId);
  // }

  // static Future<void> clearTokenAndUser() async {
  //   await instance._sharedPreferencesHelper.removeValue('user');
  //   await instance._sharedPreferencesHelper.removeValue('token');
  //   instance._token = null;
  //   instance._user = null;
  // }

  // static Future<bool> hasUser() async {
  //   return (await getUser()) != null;
  // }
}
