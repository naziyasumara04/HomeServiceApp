import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homeapp/core/constants/app_images.dart';
import 'package:homeapp/widgets/custom_button.dart';

import '../../core/constants/app_colors.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.lightBlueColor),
          onPressed: () {
            Navigator.pop(context); // Go back
          },
        ),
        title: Text(
          "Verification",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.lightBlueColor),
        ),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Verification methods",
                    style: TextStyle(
                        color: AppColors.darkGreyColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            VerifyCard(
                titleText: "Email",
                image: AppImages.emailImg,
                trailingText: "Verified"),
            SizedBox(height: 10.h,),
            VerifyCard(titleText: "Mobile number",
                image: AppImages.mobileNumImg,
                trailingText: "Verified"),
            SizedBox(height: 10.h,),
            VerifyCard(titleText: "Google 2FA",
              image: AppImages.googleVerify,
              trailingText: "Verify",
              trailingTextColor: AppColors.lightBlueColor,),
            SizedBox(height: 320.h,),
            CustomButton(btnText: "Save", onTap: () {},)
          ],
        ),
      ),
    );
  }
}

class VerifyCard extends StatelessWidget {
  final String titleText;
  final String image;
  final String trailingText;
  final Color? trailingTextColor;

  const VerifyCard({super.key,
    required this.titleText,
    required this.image,
    required this.trailingText,
    this.trailingTextColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      width: 327.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            width: 1,
            color: AppColors.borderColor,
          )),
      child: ListTile(
        leading: Image.asset(
          image,
          height: 25.h,
          width: 25.w,
        ),
        trailing: Text(trailingText,
            style: TextStyle(
              color: trailingTextColor ?? AppColors.darkGreyColor,
            )),
        title: Text(titleText),
      ),
    );
  }
}
