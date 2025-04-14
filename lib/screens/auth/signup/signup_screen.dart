import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homeapp/data/local/shared_keys.dart';
import 'package:homeapp/data/local/shared_prefs.dart';
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

//store signup data through shared_preferences
  void storeSignUpData() async {
    await setKeyFromPrefs(
        SharedPreferencesKeys.signupName, nameController.text);
    await setKeyFromPrefs(
        SharedPreferencesKeys.signupEmail, emailController.text);
    await setKeyFromPrefs(
        SharedPreferencesKeys.signInPassword, passwordController.text);

    await getKeyFromPrefs(SharedPreferencesKeys.signupName);
    await getKeyFromPrefs(SharedPreferencesKeys.signupEmail);
    await getKeyFromPrefs(SharedPreferencesKeys.signInPassword);
  }

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
        //signup button
        CustomButton(
          btnText: "Sign Up",
          onTap: () {
            storeSignUpData();
            Navigator.pushNamed(context, AppRoutes.otp);
          },
        ),
        SizedBox(
          height: 20.h,
        ),
        signInText(),
        SizedBox(
          height: 10.h,
        ),
        orCont(),
        signupWith(),
        socialButton()
      ],
    );
  }

  //signup text
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

  //name textField
  Widget name() {
    return CustomTextField(
        hintText: "Full name",
        prefixIcon: Icon(CupertinoIcons.person_alt_circle,
            size: 24, color: Colors.black),
        controller: nameController);
  }

  //email textField
  Widget email() {
    return CustomTextField(
      hintText: 'Enter your email',
      prefixIcon: Icon(Icons.email_outlined),
      controller: emailController,
    );
  }

  //password textField
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

  //terms & conditions text
  Widget termCheck() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        children: [
          Checkbox(
              checkColor: AppColors.lightBlueColor,
              focusColor: AppColors.lightBlueColor,
              activeColor: AppColors.lightBlueColor,
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

  //SignIn text
  Widget signInText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Already have an account?",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.darkGreyColor),
          ),
          GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.signIn);
              },
              child: Text(
                " Sign in now",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.lightBlueColor),
              )),
        ],
      ),
    );
  }

  //divider
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

  //text
  Widget signupWith() {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Text(
        "Sign up with",
        style: TextStyle(
            color: AppColors.darkGreyColor,
            fontWeight: FontWeight.w500,
            fontSize: 14),
      ),
    );
  }

  //social buttons
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
          ),
        ],
      ),
    );
  }
}
