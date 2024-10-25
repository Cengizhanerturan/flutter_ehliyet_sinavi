import 'dart:io';
import 'package:flutter_ehliyet_sinavi/core/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ThemeService extends GetxService {
  late ThemeMode themeMode;

  void init() {
    getTheme();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness:
            Platform.isIOS ? Brightness.light : Brightness.dark,
        systemNavigationBarColor: AppColors.secondaryBlackColor));

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  void getTheme() {
    themeMode = ThemeMode.light;
  }
}
