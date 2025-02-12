import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homeapp/widgets/custom_button.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_images.dart';
import '../../widgets/custom_textfield.dart';

class SeekerCreatePasswordScreen extends StatefulWidget {
  const SeekerCreatePasswordScreen({super.key});

  @override
  State<SeekerCreatePasswordScreen> createState() =>
      _SeekerCreatePasswordScreenState();
}

class _SeekerCreatePasswordScreenState
    extends State<SeekerCreatePasswordScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool _obscurePassText = true;
  bool _obscureConfPassText = true;

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
      body: buildBody(),
    );
  }


  Widget buildBody() {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Create password screen",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  )),
            ),
            SizedBox(
              height: 30.h,
            ),
            passwordField(),
            SizedBox(
              height: 30.h,
            ),
            CustomButton(
              btnText: "Save",
              onTap: () {
                print("Saved");
              },
            )
          ],
        ),
      ),
    );
  }


  Widget passwordField() {
    return Column(
      children: [
        CustomTextField(
          hintText: "Enter your password",
          prefixIcon: Icon(Icons.lock_outline),
          controller: passwordController,
          obscureText: _obscurePassText,
          suffixIcon: IconButton(
            icon: Icon(
              _obscurePassText
                  ? Icons.visibility_off
                  : Icons.visibility, // Change icon based on state
            ),
            onPressed: () {
              setState(() {
                _obscurePassText = !_obscurePassText;
              });
            },
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        CustomTextField(
          hintText: "Enter your password",
          prefixIcon: Icon(Icons.lock_clock_rounded),
          controller: confirmPasswordController,
          obscureText: _obscureConfPassText,
          suffixIcon: IconButton(
            icon: Icon(
              _obscureConfPassText
                  ? Icons.visibility_off
                  : Icons.visibility, // Change icon based on state
            ),
            onPressed: () {
              setState(() {
                _obscureConfPassText = !_obscureConfPassText;
              });
            },
          ),
        ),
      ],
    );
  }
}