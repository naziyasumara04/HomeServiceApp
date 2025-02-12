import 'package:flutter/material.dart';
import 'package:homeapp/core/constants/app_images.dart';
import 'package:homeapp/screens/service_seeker/seeker_otp_screen.dart';
import '../../core/constants/app_colors.dart';
import '../service_provider/provider_phone_num_screen.dart';

class SeekerPhoneNumScreen extends StatefulWidget {
  const SeekerPhoneNumScreen({super.key});

  @override
  State<SeekerPhoneNumScreen> createState() => _SeekerPhoneNumScreenState();
}

class _SeekerPhoneNumScreenState extends State<SeekerPhoneNumScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.lightBlueColor),
        title: Image.asset(
          AppImages.appLogo,
          height: 24,
          width: 28,
        ),
      ),
      body: PhoneNumScreen(
        onNext: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SeekerOtpScreen()),
          );
        },
      ),
    );
  }
}
