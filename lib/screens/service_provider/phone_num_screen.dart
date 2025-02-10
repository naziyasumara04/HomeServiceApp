import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homeapp/core/constants/app_colors.dart';
import 'package:homeapp/core/constants/app_images.dart';
import 'package:homeapp/routes/route_generator.dart';
import 'package:homeapp/widgets/custom_button.dart';
import 'package:intl_phone_field/intl_phone_Field.dart';

class PhoneNumScreen extends StatefulWidget {
  const PhoneNumScreen({super.key});

  @override
  State<PhoneNumScreen> createState() => _PhoneNumScreenState();
}

class _PhoneNumScreenState extends State<PhoneNumScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h,),
          Text(
            "Enter your Phone number to verify",
            style: TextStyle(
                color: AppColors.darkGreyColor,
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 20.h,
          ),
          IntlPhoneField(
            decoration: InputDecoration(
              labelText: 'Phone Number',
              border: OutlineInputBorder(
                borderSide: BorderSide(),
              ),
            ),
            initialCountryCode: 'IN',
            onChanged: (phone) {
              print(phone.completeNumber);
            },
          ),
          SizedBox(height: 60.h,),
          CustomButton(btnText: "Send Code",onTap: (){
            Navigator.pushNamed(context, AppRoutes.providerOtpScreen);
          },)
        ],
      ),
    );
  }
}
