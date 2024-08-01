
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:umra/lang/translation_service.dart';
import 'package:umra/services/auth_service.dart';

class MyFlavorConfig {
  dynamic myLanguages;
  ThemeData myTheme = ThemeData();
  final AppNameEnum appNameEnum;
  final List<Locale> supportedLocales;
  Locale fallbackLocale;
  final String baseUrl;

   MyFlavorConfig({
    dynamic myLanguages,
    ThemeData? myTheme,
    required this.appNameEnum,
    required this.baseUrl,
    this.supportedLocales = const [
      Locale("ar"),
      Locale("en"),
    ],
   required this.fallbackLocale ,

  }) {
    if (myLanguages != null) {
      this.myLanguages = myLanguages;
    } else {
      this.myLanguages = MyLanguages();
    }
    if (myTheme != null) this.myTheme = myTheme;
  }
}

enum AppNameEnum {user,provider}

