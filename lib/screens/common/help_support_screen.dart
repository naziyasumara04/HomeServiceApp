import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:homeapp/core/constants/app_images.dart";
import "../../core/constants/app_colors.dart";
import "../../widgets/custom_button.dart";

class HelpSupportScreen extends StatefulWidget {
  const HelpSupportScreen({super.key});

  @override
  State<HelpSupportScreen> createState() => _HelpSupportScreenState();
}

class _HelpSupportScreenState extends State<HelpSupportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: [
          Text(
            "Live chat",
            style: TextStyle(
                color: AppColors.lightBlueColor,
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.lightBlueColor),
          onPressed: () {
            Navigator.pop(context); // Go back
          },
        ),
        title: Text(
          "Help & Support",
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
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        children: [
          helpSupportCont(),
          SizedBox(height: 20.h,),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Title",
              style: TextStyle(
                  color: AppColors.darkGreyColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 14),
            ),
          ),
          textFieldContainer(
              hintText: "Enter the title of your issue", height: 56),
          SizedBox(height: 20.h,),

          Align(
            alignment: Alignment.topLeft,
            child: Text("Write in below box",
            style: TextStyle(
                color: AppColors.darkGreyColor,
                fontWeight: FontWeight.w500,
                fontSize: 14
            ),),
          ),
          textFieldContainer(hintText: "Write here", height: 114),

          SizedBox(height: 50.h,),

          CustomButton(btnText: "Send",onTap: (){},),

          SizedBox(height: 30.h,),

          liveChatCont()
        ],
      ),
    );
  }

  Widget helpSupportCont() {
    return Column(
      children: [
        Image.asset(
          AppImages.helpSupportImg,
          height: 174,
          width: 183,
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            "Hello, how can we assist you?",
            style: TextStyle(
                color: AppColors.darkGreyColor,
                fontWeight: FontWeight.w500,
                fontSize: 16),
          ),
        )
      ],
    );
  }

  Widget textFieldContainer({required String hintText, double? height}) {
    return Container(
      height: height ?? 56, // Enforce container height
      width: 327.w,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor),
        // Ensures the border remains visible
        borderRadius: BorderRadius.circular(4),
      ),
      child: SizedBox(
        height: height ?? 56, // Force TextField to respect height
        child: TextField(
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: AppColors.darkGreyColor,
              fontSize: 12,
              fontWeight: FontWeight.w400

            ),
            contentPadding: EdgeInsets.only(top: 8, left: 12),
            // Adjust hint text alignment
            border: InputBorder
                .none, // Remove default border to prevent extra padding
          ),
        ),
      ),
    );
  }

  Widget liveChatCont() {
    return GestureDetector(
      child: Container(
        height: 56.h,
        width: 327.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: AppColors.lightBlueColor,
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.chatImg, height: 23.h, width: 25.w),
            SizedBox(width: 5.w,),
            Text("Live Chat"),
          ],
        ),
      ),
    );
  }
}
