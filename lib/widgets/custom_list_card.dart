import 'package:flutter/material.dart';
import 'package:homeapp/core/constants/app_colors.dart';

class CustomListCard extends StatelessWidget {
  final String cardText;
  final String cardImage;
  final VoidCallback? onTap;
  final bool showCont;
  final Color? cardColor;

  const CustomListCard({super.key,
    required this.cardText,
    required this.cardImage,
    this.onTap,
    this.showCont = false, this.cardColor});

  @override
  Widget build(BuildContext context) {
    return Card(

      color: cardColor??AppColors.whiteColor,
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
