import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homeapp/routes/route_generator.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_images.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_social_button.dart';
import '../../../widgets/custom_textfield.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _obscureText = true;
  bool _isChecked = false;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   storeSignUpData();
  // }
  //
  // void storeSignUpData() async{
  //
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
        signupText(),
        SizedBox(height: 10.h),
        name(),
        SizedBox(
          height: 10.h,
        ),
        email(),
        SizedBox(
          height: 10.h,
        ),
        password(),
        // SizedBox(
        //   height: 5.h,
        // ),
        termCheck(),
        SizedBox(
          height: 10.h,
        ),
        CustomButton(btnText: "Sign Up",onTap: (){
          Navigator.pushNamed(context, AppRoutes.otp);
        },),
        SizedBox(height: 20.h,),
        signinText(),
        SizedBox(height: 10.h,),
        orCont(),
        signupWith(),
        socialButton()
      ],
    );
  }

  Widget signupText() {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Center(
        child: Text(
          "Enter your email and password to login",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget name() {
    return CustomTextField(
        hintText: "Full name",
        prefixIcon:Icon(CupertinoIcons.person_alt_circle, size: 24, color: Colors.black),

        controller: nameController);
  }

  Widget email() {
    return CustomTextField(
      hintText: 'Enter your email',
      prefixIcon: Icon(Icons.email_outlined),
      controller: emailController,
    );
  }

  Widget password() {
    return CustomTextField(
      hintText: "Enter your password",
      prefixIcon: Icon(Icons.lock_outline),
      controller: passwordController,
      obscureText: _obscureText,
      suffixIcon: IconButton(
        icon: Icon(
          _obscureText
              ? Icons.visibility_off
              : Icons.visibility, // Change icon based on state
        ),
        onPressed: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
      ),
    );
  }

  Widget termCheck() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        children: [
          Checkbox(
              checkColor: AppColors.lightBlueColor,
              focusColor: AppColors.lightBlueColor,
              activeColor: AppColors.lightBlueColor,
              // side: MaterialStateProperty.resolveWith<BorderSide>(
              //       (Set<MaterialState> states) {
              //     if (states.contains(MaterialState.selected)) {
              //       return BorderSide(color: AppColors.lightBlueColor, width: 2.0); // Blue border when checked
              //     }
              //     return BorderSide(color: AppColors.lightBlueColor, width: 2.0); // Blue border when unchecked
              //   },
              // ),
              side: BorderSide(color: AppColors.lightBlueColor, width: 2.0),
              fillColor: WidgetStateProperty.resolveWith<Color>(
                (Set<WidgetState> states) {
                  if (states.contains(WidgetState.selected)) {
                    return AppColors
                        .whiteColor; // Color when checkbox is selected
                  }
                  return AppColors.whiteColor; // Default color when unselected
                },
              ),
              value: _isChecked,
              onChanged: (value) {
                setState(() {
                  _isChecked = value!;
                });
              }),
          RichText(
            text: TextSpan(
              text: "I agree with FixIt’s ",
              style: TextStyle(
                color: AppColors.darkGreyColor,
                fontSize: 14,
              ),
              // Normal text color
              children: [
                TextSpan(
                  text: "Terms & Conditions",
                  style: TextStyle(
                    color: AppColors.lightBlueColor,
                    fontSize: 14, // Change color here
                    fontWeight: FontWeight.w400, // Optional: Make it bold
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget signinText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Already have an account?",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.darkGreyColor
          ),),
          GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.signIn);
              },
              child: Text(" Sign in now",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.lightBlueColor
                ),)),
        ],
      ),
    );
  }

  Widget orCont() {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Row(
        children: [
          Expanded(child: Divider(thickness: 0.7, height: 10)),
          SizedBox(
            width: 10.w,
          ),
          Text("Or"),
          SizedBox(
            width: 10.w,
          ),
          Expanded(child: Divider())
        ],
      ),
    );
  }

  Widget signupWith() {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Text("Sign up with",
      style: TextStyle(
        color: AppColors.darkGreyColor,
        fontWeight: FontWeight.w500,
        fontSize: 14
      ),),
    );
  }

  Widget socialButton() {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomSocialButton(
            text: 'Google',
            imageUrl: AppImages.googleImg,
          ),
          CustomSocialButton(
            text: 'Facebook',
            imageUrl: AppImages.facebookImg,
          )
        ],
      ),
    );
  }


}
