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

  void whereToGo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // var isLoggedIn = await prefs.getBool(SharedPreferencesKeys.keySignIn);
    bool isLoggedIn =await  prefs.getBool(SharedPreferencesKeys.keySignIn) ?? false;

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        if (isLoggedIn) {
          Navigator.pushReplacementNamed(context, AppRoutes.accountSetup); // 👈 Replace with your actual home route
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
                // Colors.grey
              ],
              // begin: Alignment.topLeft,
              //   end: Alignment.bottomRight
            ),
          ),
          child: Center(child: Image.asset(AppImages.appLogo))),
    );
  }
}
