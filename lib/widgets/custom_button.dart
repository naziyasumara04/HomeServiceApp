import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String btnText;
  final VoidCallback? onTap;

  const CustomButton({super.key, required this.btnText, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 58.h,
        width: 327.w,
        decoration: BoxDecoration(
            color: AppColors.lightBlueColor,
            borderRadius: BorderRadius.circular(6)),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            btnText,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: AppColors.whiteColor,
            ),
          ),
        ),
      ),
    );
  }
}
