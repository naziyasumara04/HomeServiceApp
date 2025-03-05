import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homeapp/core/constants/app_colors.dart';
import 'package:homeapp/core/constants/app_images.dart';

class ElectricianCard extends StatelessWidget {
  final String? text;
  final String? image;
  final String? type;
  final double? height;
  const ElectricianCard({super.key, this.text, this.image, this.type, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height:height??238.h,
      width: 327.w,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 5.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text ?? "Wiring Installation"),
              Image.asset(image ?? AppImages.wiringInstallationImg),
            ],
          ),
          Divider(),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Type",
                style: TextStyle(color: AppColors.borderColor, fontSize: 12),
              ),
              Text(
                type ?? "Electrician",
                style: TextStyle(color: AppColors.darkGreyColor, fontSize: 12),
              )
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "price",
                style: TextStyle(color: AppColors.borderColor, fontSize: 12),
              ),
              Text(
                "\$20/H",
                style: TextStyle(color: AppColors.darkGreyColor, fontSize: 12),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Material",
                style: TextStyle(color: AppColors.borderColor, fontSize: 12),
              ),
              Text(
                "Not Included",
                style: TextStyle(color: AppColors.darkGreyColor, fontSize: 12),
              )
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Traveling",
                style: TextStyle(color: AppColors.borderColor, fontSize: 12),
              ),
              Text(
                "Free",
                style: TextStyle(color: AppColors.darkGreyColor, fontSize: 12),
              )
            ],
          ),
        ],
      ),
    );
  }
}
