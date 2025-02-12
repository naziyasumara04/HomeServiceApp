import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homeapp/screens/service_seeker/seeker_otp_screen.dart';
import 'package:homeapp/widgets/custom_button.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_images.dart';
import '../../widgets/custom_textfield.dart';

class SeekerEmailScreen extends StatefulWidget {
  const SeekerEmailScreen({super.key});

  @override
  State<SeekerEmailScreen> createState() => _SeekerEmailScreenState();
}

class _SeekerEmailScreenState extends State<SeekerEmailScreen> {
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
            SizedBox(height: 30.h,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Enter your Email address to verify",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ),
              ),
            ),
            SizedBox(height: 30.h,),
            CustomTextField(
              hintText: 'Example@gmail.com',
              prefixIcon: Icon(Icons.email_outlined),
              controller: null,
            ),
            SizedBox(height: 30.h,),
            CustomButton(
              btnText: "Send Code",
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SeekerOtpScreen()));
              },
            )
          ],
        ),
      ),
    );
  }
}
