import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homeapp/core/constants/app_colors.dart';
import 'package:homeapp/widgets/custom_button.dart';
import 'package:intl_phone_field/intl_phone_Field.dart';

class PhoneNumScreen extends StatefulWidget {
  final VoidCallback? onNext;
  const PhoneNumScreen({super.key, this.onNext});

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
          CustomButton(btnText: "Send Code",onTap:widget.onNext),
        ],
      ),
    );
  }
}

//
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:homeapp/core/constants/app_colors.dart';
// import 'package:homeapp/widgets/custom_button.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';
//
// class PhoneNumScreen extends StatefulWidget {
//   final VoidCallback onNext;  // Property of the StatefulWidget
//
//   const PhoneNumScreen({super.key, required this.onNext}); // Passed through constructor
//
//   @override
//   State<PhoneNumScreen> createState() => _PhoneNumScreenState();
// }
//
// class _PhoneNumScreenState extends State<PhoneNumScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: buildBody(),
//     );
//   }
//
//   Widget buildBody() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 30.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(height: 20.h),
//           Text(
//             "Enter your Phone number to verify",
//             style: TextStyle(
//               color: AppColors.darkGreyColor,
//               fontSize: 18,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//           SizedBox(height: 20.h),
//           IntlPhoneField(
//             decoration: InputDecoration(
//               labelText: 'Phone Number',
//               border: OutlineInputBorder(),
//             ),
//             initialCountryCode: 'IN',
//             onChanged: (phone) {
//               print(phone.completeNumber);
//             },
//           ),
//           SizedBox(height: 60.h),
//           CustomButton(
//             btnText: "Send Code",
//             onTap: widget.onNext, // Access the onNext using widget.onNext
//           ),
//         ],
//       ),
//     );
//   }
// }
