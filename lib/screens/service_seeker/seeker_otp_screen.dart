import 'package:flutter/material.dart';
import 'package:homeapp/screens/service_provider/provider_otp_screen.dart';
import 'package:homeapp/screens/service_seeker/seeker_create_password_screen.dart';
import '../../core/constants/app_images.dart';

class SeekerOtpScreen extends StatefulWidget {
  const SeekerOtpScreen({super.key});

  @override
  State<SeekerOtpScreen> createState() => _SeekerOtpScreenState();
}

class _SeekerOtpScreenState extends State<SeekerOtpScreen> {
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
      body: ProviderOtpScreen(
          onNext: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SeekerCreatePasswordScreen()));
      }),
    );
  }
}
