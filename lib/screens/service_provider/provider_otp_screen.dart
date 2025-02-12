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
  int _counter = 60;
  final TextEditingController pinCodeController = TextEditingController();

  Timer? _timer;

  void _startCountdown() {
    if (_timer != null) {
      _timer!.cancel(); // Cancel previous timer if any
    }
    setState(() {
      _counter = 60; // Reset counter when button is clicked
    });

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_counter > 0) {
        setState(() {
          _counter--;
        });
      } else {
        timer.cancel(); // Stop timer when it reaches 0
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel timer when widget is removed
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
          SizedBox(
            height: 40.h,
          ),
          Text(
            "Enter 5-digit PIN code sent to your phone number",
            style: TextStyle(
                color: AppColors.darkGreyColor,
                fontWeight: FontWeight.w500,
                fontSize: 18.sp),
          ),
          SizedBox(
            height: 40.h,
          ),
          pinCodeField(),
          SizedBox(
            height: 40.h,
          ),
          CustomButton(
            btnText: "Verify",
            // _startCountdown
            onTap: widget.onNext,
          ),
          SizedBox(
            height: 20.h,
          ),
          otpText()
        ],
      ),
    );
  }

  Widget pinCodeField() {
    return PinCodeTextField(
      autofocus: true,
      controller: pinCodeController,
      hideCharacter: true,
      highlight: true,
      pinBoxRadius: 6,
      pinBoxWidth: 60,
      pinBoxHeight: 60,
      defaultBorderColor: AppColors.borderColor,
      hasTextBorderColor: AppColors.borderColor,
      maxLength: 5,
      maskCharacter: "*",
    );
  }

  Widget otpText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            height: 24,
            width: 24,
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.lightBlueColor),
                borderRadius: BorderRadius.circular(50)),
            child: Center(child: Text('$_counter'))),
        SizedBox(
          width: 10.w,
        ),
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
