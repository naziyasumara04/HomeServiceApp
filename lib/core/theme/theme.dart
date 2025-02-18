import 'package:flutter/material.dart';
import 'package:homeapp/core/constants/app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.lightBlueColor,
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
      appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(color: AppColors.lightBlueColor)),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: AppColors.darkGreyColor,
        ),


      ),
    );
  }
}
