import 'package:flutter/material.dart';
import 'package:homeapp/core/constants/app_colors.dart';

class ProfileCard extends StatelessWidget {
  final String cardText;
  final String cardImage;
  final VoidCallback? onTap;
  final bool showCont;

  const ProfileCard({super.key,
    required this.cardText,
    required this.cardImage,
    this.onTap,
    this.showCont = false});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          onTap: onTap,
          leading: Image.asset(
            cardImage,
            height: 44,
            width: 44,
          ),
          title: Text(
            cardText,
            style: TextStyle(
                color: AppColors.darkGreyColor,
                fontWeight: FontWeight.w500,
                fontSize: 14),
          ),
          trailing: showCont
              ? Container(
            height: 44,
            width: 44,
            decoration: BoxDecoration(
                color: AppColors.lightBlueColor,
                borderRadius: BorderRadius.circular(6)),
            child: Icon(
              Icons.arrow_forward_ios,
              color: AppColors.whiteColor,
            ),
          )
              : SizedBox()),
    );
  }
}
