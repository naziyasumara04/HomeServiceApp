import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homeapp/core/constants/app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      fontFamily: GoogleFonts.poppins().fontFamily,
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
          bodyLarge: GoogleFonts.poppins(
              fontSize: 12.sp,
              color: AppColors.darkGreyColor,
              fontWeight: FontWeight.w600),
          displayLarge: GoogleFonts.poppins(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.darkGreyColor,
          ),
          displaySmall: GoogleFonts.poppins(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.lightBlueColor),
          bodySmall: GoogleFonts.poppins(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.darkGreyColor,
          )),
    );
  }



}