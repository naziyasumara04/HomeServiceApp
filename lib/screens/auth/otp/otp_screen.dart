import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homeapp/routes/route_generator.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

import '../../../core/constants/app_colors.dart';
import '../../../widgets/custom_button.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController otpController = TextEditingController();
  FocusNode otpFocusNode = FocusNode();

  @override
  void dispose() {
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
      padding: const EdgeInsets.all(14.0),
      child: Column(
        children: [
          SizedBox(
            height: 120.h,
          ),
          verifyText(),
          SizedBox(
            height: 20.h,
          ),
          text(),
          SizedBox(
            height: 20.h,
          ),
          otpTextField(),
          SizedBox(
            height: 30.h,
          ),
          verifyButton(),
          SizedBox(
            height: 20.h,
          ),
          resendText()
        ],
      ),
    );
  }

  Widget verifyText() {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Check your email",
          style: TextStyle(
              color: AppColors.darkGreyColor,
              fontWeight: FontWeight.w900,
              fontSize: 25),
        ),
      ],
    );
  }

  Widget text() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        "We have send an verification code to this email.please enter it here.",
        style: TextStyle(
          color: AppColors.darkGreyColor,
        ),
      ),
    );
  }

  Widget otpTextField() {
    return PinCodeTextField(
      controller: otpController,
      maxLength: 6,
      // hideCharacter: true,
      pinBoxHeight: 55.h,
      pinBoxWidth: 40.w,
      autofocus: true,
      highlight: true,
      pinBoxDecoration: ProvidedPinBoxDecoration.defaultPinBoxDecoration,
      pinTextAnimatedSwitcherTransition:
          ProvidedPinBoxTextAnimation.scalingTransition,
      highlightColor: Colors.blue,
      defaultBorderColor: AppColors.darkGreyColor,
      highlightPinBoxColor: AppColors.lightGreyColor,
      focusNode: otpFocusNode,
      pinBoxRadius: 16.0,
      keyboardType: TextInputType.number,
      onDone: (text) {
        Navigator.pushNamed(context, AppRoutes.otpSuccess);
      },
    );
  }

  // Widget otpTextField() {
  //   return PinCodeTextField(
  //     controller: otpController,
  //     maxLength: 6,
  //     hideCharacter: true,
  //     autofocus: true,
  //     highlight: true,
  //     highlightColor: Colors.blue,
  //     defaultBorderColor: AppColors.darkGreyColor,
  //     highlightPinBoxColor: AppColors.lightGreyColor,
  //     focusNode: otpFocusNode,
  //     keyboardType: TextInputType.number,
  //     onDone: (text) {
  //       Navigator.pushNamed(context, AppRoutes.otpSuccess);
  //     },
  //   );
  // }

  Widget verifyButton() {
    return CustomButton(
      btnText: "Verify Code",
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.otpSuccess);
      },
    );
  }

  Widget resendText() {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
            text: "I don't receive an email yet  ",
            style: TextStyle(
              color: AppColors.darkGreyColor,
              fontWeight: FontWeight.w700,
            )),
        TextSpan(
            text: "Resend it",
            style: TextStyle(
                color: AppColors.lightBlueColor,
                fontWeight: FontWeight.w900,
                decoration: TextDecoration.underline,
                decorationThickness: 2.0,
                height: 1.5))
      ]),
    );
  }
}
