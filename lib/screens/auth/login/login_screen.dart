import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homeapp/routes/route_generator.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_images.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_social_button.dart';
import '../../../widgets/custom_textfield.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _obscureText = true;


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
        body: buildBody());
  }

  Widget buildBody() {
    return Column(
      children: [
        SizedBox(
          height: 10.h,
        ),
        signinText(),
        SizedBox(
          height: 15.h,
        ),
        email(),
        SizedBox(
          height: 10.h,
        ),
        password(),
        forgetpasswordText(),
        SizedBox(
          height: 20.h,
        ),
        CustomButton(btnText: "Sign In",onTap: (){
          Navigator.pushNamed(context, AppRoutes.otp);
        },),
        SizedBox(
          height: 5.h,
        ),
        signupText(),
        orCont(),
        loginText(),
        socialButton(),
      ],
    );
  }

  Widget signinText() {
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

  Widget forgetpasswordText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.forgetPassword);
            },
            child: Text(
              "Forget Password?",
              style: TextStyle(color: AppColors.darkGreyColor, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  Widget signupText() {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "New to fixIt? ",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          InkWell(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.signup);
              },
              child: Text(
                "Sign up now",
                style: TextStyle(
                  color: AppColors.lightBlueColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ))
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

  Widget loginText() {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Text("Log in with"),
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
