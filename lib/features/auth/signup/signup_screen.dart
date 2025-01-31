import 'package:flutter/material.dart';

import '../../../common/constants/app_images.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        // title: Image.asset(AppImages.),
      ),
      body:buildBody(),
    );
  }

  Widget buildBody(){
    return Column(
      children: [
        signupText(),
      ],
    );
  }

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

}
