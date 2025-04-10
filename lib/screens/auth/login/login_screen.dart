import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homeapp/data/local/shared_keys.dart';
import 'package:homeapp/data/local/shared_prefs.dart';
import '../../../core/constants/app_images.dart';
import '../../../routes/route_generator.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_social_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscureText = true;

  void loginDataStore() async {
    await setKeyFromPrefs(
        SharedPreferencesKeys.signInEmail, emailController.text);
    await setKeyFromPrefs(
        SharedPreferencesKeys.signInPassword, passwordController.text);

    String signinEmail =
        await getKeyFromPrefs(SharedPreferencesKeys.signInEmail);
    print("email isssssssssssss $signinEmail");

    String signinPassword =
        await getKeyFromPrefs(SharedPreferencesKeys.signInPassword);
    print("password issssssss $signinPassword");
  }

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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Text(
              "Enter your email and password to login",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 20.h),
            buildEmailField(),
            SizedBox(height: 15.h),
            buildPasswordField(),
            buildForgotPasswordText(),
            SizedBox(height: 20.h),
            button(),
            SizedBox(height: 15.h),
            buildSignupText(),
            buildOrDivider(),
            socialButton(),
          ],
        ),
      ),
    );
  }

  Widget buildEmailField() {
    return SizedBox(
      height: 56.h,
      width: 327.w,
      child: TextField(
        controller: emailController,
        style: GoogleFonts.poppins(fontSize: 14), // Ensure consistent text size
        decoration: InputDecoration(
          hintText: "Enter your email",
          hintStyle: GoogleFonts.poppins(fontSize: 14),
          labelText: "Enter your email",
          labelStyle: GoogleFonts.poppins(fontSize: 14),
          prefixIcon: Icon(Icons.email_outlined),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget buildPasswordField() {
    return SizedBox(
      height: 56.h,
      width: 327.w,
      child: TextField(
        controller: passwordController,
        obscureText: _obscureText,
        style: GoogleFonts.poppins(fontSize: 14),
        decoration: InputDecoration(
          hintText: "Enter your password",
          labelText: "Enter your password",
          labelStyle: GoogleFonts.poppins(fontSize: 14),
          hintStyle: GoogleFonts.poppins(fontSize: 14),
          prefixIcon: Icon(Icons.lock_outline),
          border: OutlineInputBorder(),
          suffixIcon: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ),
        ),
      ),
    );
  }

  Widget buildForgotPasswordText() {
    return Align(
      alignment: Alignment.bottomRight,
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, '/forgotPassword');
          // Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetPasswordScreen()));
          Navigator.pushNamed(context, AppRoutes.forgetPassword);
        },
        child: Text(
          "Forgot Password?",
          style: TextStyle(color: Colors.blueAccent, fontSize: 14),
        ),
      ),
    );
  }

  Widget button() {
    return CustomButton(
      btnText: "Sign In",
      onTap: () {
        loginDataStore();
        Navigator.pushNamed(context, AppRoutes.otp);
      },
    );
  }

  Widget buildSignupText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("New to FixIt? "),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/signup');
          },
          child: Text(
            "Sign up now",
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }

  Widget buildOrDivider() {
    return Row(
      children: const [
        Expanded(child: Divider()),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text("Or"),
        ),
        Expanded(child: Divider()),
      ],
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
