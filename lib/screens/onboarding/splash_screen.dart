import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_images.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => OnboardingScreen()),
        );
      }

      //   Navigator.pushReplacement(
      //     context,
      //     MaterialPageRoute(builder: (context) =>OnboardingScreen()),
      //   );
      // });
    });
    super.initState();
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
