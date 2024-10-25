import 'package:flutter_ehliyet_sinavi/core/config/theme/app_colors.dart';
import 'package:flutter_ehliyet_sinavi/core/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

final ThemeData darkTheme = ThemeData.light().copyWith();

final ThemeData lightTheme = ThemeData.dark().copyWith(
  brightness: Brightness.dark,
  primaryColor: AppColors.primaryColor,
  scaffoldBackgroundColor: AppColors.backgroundColor,
  cardColor: AppColors.primaryCardColor,
  canvasColor: AppColors.secondaryCardColor,
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  dividerColor: AppColors.dividerColor,
  iconTheme: IconThemeData(
    size: 16.px,
    color: AppColors.primaryBlackColor,
  ),
  primaryIconTheme: IconThemeData(
    size: 16.px,
    color: AppColors.primaryBlackColor,
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: AppColors.primaryBlackColor,
    selectionHandleColor: AppColors.primaryBlackColor,
  ),
  textTheme: TextTheme(
    headlineMedium: TextStyle(
      fontFamily: AppConstants.textFontFamily,
      fontSize: 19.0.sp,
      letterSpacing: 0.25,
      color: AppColors.primaryBlackColor,
    ),
    titleLarge: TextStyle(
      fontFamily: AppConstants.textFontFamily,
      fontSize: 21.0.sp,
      letterSpacing: 0.25,
      color: AppColors.primaryBlackColor,
    ),
    titleMedium: TextStyle(
      fontFamily: AppConstants.textFontFamily,
      fontSize: 19.0.sp,
      letterSpacing: 0.25,
      color: AppColors.primaryBlackColor,
    ),
    titleSmall: TextStyle(
      fontFamily: AppConstants.textFontFamily,
      fontSize: 17.5.sp,
      letterSpacing: 0.75,
      color: AppColors.primaryBlackColor,
    ),
    bodyLarge: TextStyle(
      fontFamily: AppConstants.textFontFamily,
      fontSize: 17.0.sp,
      letterSpacing: 0.5,
      color: AppColors.primaryBlackColor,
    ),
    bodyMedium: TextStyle(
      fontFamily: AppConstants.textFontFamily,
      fontSize: 16.0.sp,
      letterSpacing: 0.5,
      color: AppColors.primaryBlackColor,
    ),
    bodySmall: TextStyle(
      fontFamily: AppConstants.textFontFamily,
      fontSize: 15.0.sp,
      letterSpacing: 0.5,
      color: AppColors.primaryBlackColor,
    ),
    labelLarge: TextStyle(
      fontFamily: AppConstants.textFontFamily,
      fontSize: 15.0.sp,
      letterSpacing: 0.5,
      color: AppColors.primaryBlackColor,
    ),
    labelMedium: TextStyle(
      fontFamily: AppConstants.textFontFamily,
      fontSize: 14.0.sp,
      letterSpacing: 0.5,
      color: AppColors.primaryBlackColor,
    ),
    labelSmall: TextStyle(
      fontFamily: AppConstants.textFontFamily,
      fontSize: 13.0.sp,
      letterSpacing: 0.5,
      color: AppColors.primaryBlackColor,
    ),
  ),
  colorScheme: ColorScheme.fromSwatch()
      .copyWith(error: Colors.red)
      .copyWith(brightness: Brightness.dark)
      .copyWith(surface: AppColors.backgroundColor),
);
