import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homeapp/core/constants/app_images.dart';
import 'package:homeapp/widgets/custom_button.dart';

import '../../core/constants/app_colors.dart';

class UpgradeScreen extends StatefulWidget {
  const UpgradeScreen({super.key});

  @override
  State<UpgradeScreen> createState() => _UpgradeScreenState();
}

class _UpgradeScreenState extends State<UpgradeScreen> {
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
          "Upgrade",
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
    return Column(
      children: [
        upgradeCont(),
      ],
    );
  }

  Widget upgradeCont() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Image.asset(AppImages.upgradeImg),
          Text(
            "Upgrade to get full access to",
            style: TextStyle(
              color: AppColors.darkGreyColor,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          UpgradeText(
            upgText: 'Access to three Services',
          ),
          UpgradeText(upgText: "Featured Listings"),
          UpgradeText(upgText: "Gallery Showcase"),
          UpgradeText(upgText: "Extended Service Area"),
          UpgradeText(upgText: "Premium Badge"),
          SizedBox(height: 140.h,),
          CustomButton(btnText: "Upgrade",)
        ],
      ),
    );
  }
}

class UpgradeText extends StatelessWidget {
  final String upgText;

  const UpgradeText({super.key, required this.upgText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 34.h,
          child: ListTile(
            leading: Icon(Icons.check,color: AppColors.lightBlueColor,size: 15,),
            title: Text(upgText,
            style: TextStyle(
              color: AppColors.darkGreyColor,
              fontSize: 14,
              fontWeight: FontWeight.w500
            ),),
          ),
        ),
        Divider()
      ],
    );
  }
}
