import 'package:flutter/material.dart';
import 'package:homeapp/routes/route_generator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_images.dart';
import '../../data/local/shared_keys.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    whereToGo();
    super.initState();
  }


  //skip login screen if user logged in
  void whereToGo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    bool isLoggedIn =
        await prefs.getBool(SharedPreferencesKeys.keySignIn) ?? false;

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        if (isLoggedIn) {
          Navigator.pushNamed(context, AppRoutes.signIn);
          // Navigator.pushReplacementNamed(context, AppRoutes.accountSetup);
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => OnboardingScreen()),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white,
                AppColors.lightBlueColor,
              ],
            ),
          ),
          child: Center(child: Image.asset(AppImages.appLogo))),
    );
  }
}
