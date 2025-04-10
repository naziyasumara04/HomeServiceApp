import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/app_colors.dart';

class CustomCard extends StatelessWidget {
  final IconData? cardIcon;
  final String cardText;
  final double? cardWidth;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomCard(
      {
        super.key,
        this.cardIcon,
        required this.cardText,
        this.cardWidth,
        required this.isSelected,
        required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: cardWidth??66,
        height: 30.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color:
            isSelected ? AppColors.lightBlueColor : AppColors.whiteColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (cardIcon != null) ...[
              Icon(cardIcon!,
                  size: 16,
                  color: isSelected
                      ? AppColors.whiteColor
                      : AppColors.lightBlueColor),
              SizedBox(
                width: 5.w,
              ),
            ],
            // cardIcon?SizedBox(width: 5.h,):SizedBox(width: 0,),
            Text(
              cardText,
              style: TextStyle(
                  color: isSelected
                      ? AppColors.whiteColor
                      : AppColors.lightBlueColor),
            ),
          ],
        ),
      ),
    );
  }
}