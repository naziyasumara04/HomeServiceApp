import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homeapp/routes/route_generator.dart';
import 'package:homeapp/widgets/custom_button.dart';

import '../../core/constants/app_colors.dart';
import '../../widgets/electrician_card.dart';

class SelectServiceScreen extends StatefulWidget {
  const SelectServiceScreen({super.key});

  @override
  State<SelectServiceScreen> createState() => _SelectServiceScreenState();
}

class _SelectServiceScreenState extends State<SelectServiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Selected Service"),
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
            ElectricianCard(),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Provide Specific Instructions or Details",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            textFieldContainer(hintText: "Write here", height: 114.h),
            SizedBox(
              height: 30.h,
            ),
            CustomButton(
              btnText: "Next",
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.wiringInstallationMap);

              },
            ),
          ],
        ),
      ),
    );
  }

  Widget textFieldContainer({required String hintText, double? height}) {
    return Container(
      height: height ?? 56, // Enforce container height
      width: 327.w,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor),
        // Ensures the border remains visible
        borderRadius: BorderRadius.circular(4),
      ),
      child: SizedBox(
        height: height ?? 56, // Force TextField to respect height
        child: TextField(
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
                color: AppColors.darkGreyColor,
                fontSize: 12,
                fontWeight: FontWeight.w400),
            contentPadding: EdgeInsets.only(top: 8, left: 12),
            // Adjust hint text alignment
            border: InputBorder
                .none, // Remove default border to prevent extra padding
          ),
        ),
      ),
    );
  }
}
