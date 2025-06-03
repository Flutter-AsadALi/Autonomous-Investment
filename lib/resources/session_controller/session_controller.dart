// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class SessionController {
  static String selectedLanguageId = "en";
  static String selectedLandingId = "dashboard";
  static String comeFrom = "dashboard";
  static String authToken = "";
  static String randomCode = "";
  static bool isStoreMyVapery = true;//true for My vapery store view and false for other than my vapery
  static bool isLogin = false;
  static bool isComeFromHomeCart = false;
  static String baseURlProductImage = "https://api.smuccidrop.com/public/uploads/product_images/";

  static int listRefreshTime = 30;
  static int mapRefreshTime = 60;
  static final SessionController _session = SessionController._internel();

  static Color themeTextColor = const Color.fromRGBO(139, 54, 223, 1);
  static Color themeDarkColor = const Color.fromRGBO(35, 64, 101, 1);
  static Color themeDark = const Color.fromRGBO(67, 63, 63, 1);
  static Color themeLightColor = const Color.fromRGBO(0, 112, 255, 1);
  static Color theme =  Colors.white;
  static bool deviceSizeBig = false;
  static bool isMapScreenOpen = false;

  factory SessionController() {
    return _session;
  }

  SessionController._internel();
}
