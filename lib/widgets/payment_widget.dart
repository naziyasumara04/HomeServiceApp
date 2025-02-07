import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/app_colors.dart';



class PaymentWidget extends StatelessWidget {
  final String listImage;
  final String text;
  final bool isSelected;
  final VoidCallback onTap;
  final VoidCallback onSelect;

  // final IconData listIcon;

  const PaymentWidget({super.key,
    required this.listImage,
    required this.text,
    required this.isSelected,
    required this.onSelect, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 56.h,
        width: 327.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: isSelected ? Colors.blue.shade100 : AppColors.whiteColor,
          border: Border.all(
            color: isSelected
                ? AppColors.lightBlueColor
                : AppColors.borderColor, // Border color
            // width: 2.0, // Border thickness
          ),
        ),
        child: ListTile(
          onTap: onSelect,
          leading: Image.asset(
            listImage,
            height: 25,
            width: 25,
          ),
          title: Text(text),
          trailing: Icon(
            Icons.check,
            color: isSelected ? AppColors.lightBlueColor : AppColors
                .borderColor,
            size: 15,
          ),
        ),
      ),
    );
  }
}
