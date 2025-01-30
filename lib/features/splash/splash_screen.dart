import 'package:flutter/material.dart';
import 'package:homeapp/common/constants/app_colors.dart';
import 'package:homeapp/common/constants/app_images.dart';

import '../onboard/onboarding_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), () {

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) =>OnboardingScreen()),
        );
      });
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient:LinearGradient(colors: [
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
