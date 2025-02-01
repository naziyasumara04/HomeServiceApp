import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homeapp/common/constants/app_colors.dart';
import 'package:homeapp/common/widgets/custom_button.dart';
import 'package:homeapp/common/widgets/custom_text_field.dart';
import 'package:homeapp/routes/route_generator.dart';

import '../../../common/constants/app_images.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController oldpasswordController = TextEditingController();
  final TextEditingController newpasswordController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();
  bool _obscureoldText = true;
  bool _obscurenewText = true;
  bool _obscureconfirmText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          AppImages.appLogo,
          height: 24,
          width: 28,
        ),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Column(
      children: [
        SizedBox(
          height: 40.h,
        ),
        resetPassword(),
        SizedBox(
          height: 30.h,
        ),
        oldPassword(),
        SizedBox(
          height: 20.h,
        ),
        newPassword(),
        SizedBox(
          height: 20.h,
        ),
        confirmPassword(),
        SizedBox(
          height: 30.h,
        ),
        updateBtn()
      ],
    );
  }

  Widget resetPassword() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Reset Password",
            style: TextStyle(
                color: AppColors.darkGreyColor,
                fontSize: 30,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget oldPassword() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: CustomTextField(
        hintText: "Enter your old password",
        prefixIcon: Icon(Icons.lock_outline),
        controller: oldpasswordController,
        obscureText: _obscureoldText,
        suffixIcon: IconButton(
          icon: Icon(
            _obscureoldText
                ? Icons.visibility_off
                : Icons.visibility, // Change icon based on state
          ),
          onPressed: () {
            setState(() {
              _obscureoldText = !_obscureoldText;
            });
          },
        ),
      ),
    );
  }

  Widget newPassword() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: CustomTextField(
        hintText: "Enter new password",
        prefixIcon: Icon(Icons.lock_outline),
        controller: newpasswordController,
        obscureText: _obscurenewText,
        suffixIcon: IconButton(
          icon: Icon(
            _obscurenewText
                ? Icons.visibility_off
                : Icons.visibility, // Change icon based on state
          ),
          onPressed: () {
            setState(() {
              _obscurenewText = !_obscurenewText;
            });
          },
        ),
      ),
    );
  }

  Widget confirmPassword() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: CustomTextField(
        hintText: "Enter confirm password",
        prefixIcon: Icon(Icons.lock_outline),
        controller: confirmpasswordController,
        obscureText: _obscureconfirmText,
        suffixIcon: IconButton(
          icon: Icon(
            _obscureconfirmText
                ? Icons.visibility_off
                : Icons.visibility, // Change icon based on state
          ),
          onPressed: () {
            setState(() {
              _obscureconfirmText = !_obscureconfirmText;
            });
          },
        ),
      ),
    );
  }

  Widget updateBtn() {
    return CustomButton(btnText: "Update password",onTap: (){
      Navigator.pushNamed(context, AppRoutes.otp);
    },);
  }
}
