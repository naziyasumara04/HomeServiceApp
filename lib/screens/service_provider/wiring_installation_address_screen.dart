import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homeapp/routes/route_generator.dart';
import 'package:homeapp/screens/service_provider/wiring_installation_time_screen.dart';
import '../../core/constants/app_colors.dart';
import '../../widgets/custom_button.dart';

class WiringInstallationAddressScreen extends StatefulWidget {
  const WiringInstallationAddressScreen({super.key});

  @override
  State<WiringInstallationAddressScreen> createState() =>
      _WiringInstallationAddressScreenState();
}

class _WiringInstallationAddressScreenState
    extends State<WiringInstallationAddressScreen> {
  final TextEditingController houseNumberController = TextEditingController();
  final TextEditingController streetNumberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Wiring Installation"),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Enter your location address",
              style: Theme.of(context).textTheme.displayLarge,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text("House number"),
            SizedBox(
              height: 5.h,
            ),
            textFieldContainer(
                keyboardType: TextInputType.number,
                controller: houseNumberController,
                hintText: "Enter house number",
                height: 56.h),
            SizedBox(
              height: 10.h,
            ),
            Text("Street number"),
            SizedBox(
              height: 5.h,
            ),
            textFieldContainer(
                keyboardType: TextInputType.number,
                controller: streetNumberController,
                hintText: "Enter street number",
                height: 56.h),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              height: 5.h,
            ),
            Text("Complete Address"),
            SizedBox(
              height: 5.h,
            ),
            textFieldContainer(
                keyboardType: TextInputType.text,
                controller: addressController,
                hintText: "Enter street address",
                height: 56.h),
            SizedBox(
              height: 300.h,
            ),
            CustomButton(
              btnText: 'Next',
              onTap: () {
                print(addressController.text);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => WiringInstallationTimeScreen(
                              address: addressController.text,
                              houseNo: houseNumberController.text,
                              streetNo: streetNumberController.text,
                            )));
                // Navigator.pushNamed(context, AppRoutes.wiringInstallationTime);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget textFieldContainer(
      {required String hintText,
      double? height,
      required TextEditingController controller,
      required TextInputType keyboardType}) {
    return Container(
      height: height ?? 56,
      width: 327.w,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor),
        // Ensures the border remains visible
        borderRadius: BorderRadius.circular(4),
      ),
      child: SizedBox(
        height: height ?? 56,
        child: TextField(
          keyboardType: keyboardType,
          controller: controller,
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
