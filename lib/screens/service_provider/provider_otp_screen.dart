import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homeapp/core/constants/app_colors.dart';
import 'package:homeapp/widgets/custom_button.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'dart:async';

class ProviderOtpScreen extends StatefulWidget {
  final VoidCallback onNext;

  const ProviderOtpScreen({super.key, required this.onNext});

  @override
  State<ProviderOtpScreen> createState() => _ProviderOtpScreenState();
}

class _ProviderOtpScreenState extends State<ProviderOtpScreen> {
  final int _counter = 60;
  final TextEditingController pinCodeController = TextEditingController();

  Timer? _timer;
  FocusNode otpFocusNode = FocusNode();

  @override
  void dispose() {
    _timer?.cancel();
    otpFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          SizedBox(height: 40.h),
          //otp text
          Text(
            "Enter 6-digit PIN code sent to your phone number",
            style: TextStyle(
                color: AppColors.darkGreyColor,
                fontWeight: FontWeight.w500,
                fontSize: 18.sp),
          ),
          SizedBox(height: 40.h),
          pinCodeField(),
          SizedBox(height: 40.h),
          //verify button
          CustomButton(
            btnText: "Verify",
            onTap: widget.onNext,
          ),
          SizedBox(height: 20.h),
          otpText()
        ],
      ),
    );
  }

  //otp field
  Widget pinCodeField() {
    return PinCodeTextField(
      autofocus: true,
      hideCharacter: true,
      highlight: true,
      pinBoxRadius: 16.0,
      defaultBorderColor: AppColors.darkGreyColor,
      hasTextBorderColor: AppColors.borderColor,
      maxLength: 6,
      maskCharacter: "*",
      controller: pinCodeController,
      pinBoxHeight: 55.h,
      pinBoxWidth: 48.w,
      pinBoxDecoration: ProvidedPinBoxDecoration.defaultPinBoxDecoration,
      pinTextAnimatedSwitcherTransition:
          ProvidedPinBoxTextAnimation.scalingTransition,
      highlightColor: Colors.blue,
      highlightPinBoxColor: AppColors.lightGreyColor,
      focusNode: otpFocusNode,
    );
  }

  //otp text
  Widget otpText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            height: 30,
            width: 30,
            padding: EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.lightBlueColor),
            ),
            child: Center(child: Text('$_counter'))),
        SizedBox(width: 10.w),
        Text(
          "Did not received code? ",
          style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.darkGreyColor),
        ),
        InkWell(
          child: Text(
            "send again",
            style: TextStyle(
              color: AppColors.lightBlueColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        )
      ],
    );
  }
}
