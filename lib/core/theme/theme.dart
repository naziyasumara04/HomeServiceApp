import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homeapp/core/constants/app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.lightBlueColor,
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
      appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
              color: AppColors.lightBlueColor,
              fontWeight: FontWeight.w600,
              fontSize: 18.sp),
          iconTheme: IconThemeData(color: AppColors.lightBlueColor)),
      textTheme: TextTheme(
          // headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.blue),
          bodyLarge: TextStyle(
              fontSize: 12.sp,
              color: AppColors.darkGreyColor,
              fontWeight: FontWeight.w600),
          displayLarge: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.darkGreyColor,
          ),
          displaySmall: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.lightBlueColor),
          bodySmall: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.darkGreyColor,
          )),
    );
  }
}
