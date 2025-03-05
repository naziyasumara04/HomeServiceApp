import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../core/constants/app_colors.dart';

class CustomSocialButton extends StatelessWidget {
  final String text;
  final String imageUrl;
  final VoidCallback? onTap;

  const CustomSocialButton(
      {super.key, required this.text, required this.imageUrl, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(
          left: 12,
          right: 12,
          bottom: 10,
          top: 10,
        ),
        height: 56.h,
        width: 155.w,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.greyColor),
            borderRadius: BorderRadius.circular(6)),
        child: Row(
          children: [
            Image.asset(imageUrl),
            SizedBox(width: 10.w,),
            Text(text,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16
            ),),
          ],
        ),
      ),
    );
  }
}
