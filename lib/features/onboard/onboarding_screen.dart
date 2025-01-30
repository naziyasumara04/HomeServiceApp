import 'package:flutter/material.dart';
import 'package:homeapp/common/constants/app_colors.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              AppColors.lightBlueColor,
              AppColors.darkBlueColor,
            ]),
          ),
          child: Center(child: Text("On boarding screeen"))),
    );
  }
}
