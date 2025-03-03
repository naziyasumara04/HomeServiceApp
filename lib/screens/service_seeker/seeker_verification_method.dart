import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homeapp/screens/service_seeker/seeker_email_screen.dart';
import 'package:homeapp/widgets/custom_button.dart';
import 'package:homeapp/widgets/payment_widget.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_images.dart';


class SeekerVerificationMethod extends StatefulWidget {
  const SeekerVerificationMethod({super.key});

  @override
  State<SeekerVerificationMethod> createState() =>
      _SeekerVerificationMethodState();
}

class _SeekerVerificationMethodState extends State<SeekerVerificationMethod> {
  bool onSelectItem = true;

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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Select Verification method ",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            PaymentWidget(
                listImage: AppImages.emailImg,
                text: "Email",
                isSelected: onSelectItem,
                onTap: () {
                  setState(() {
                    onSelectItem = true;
                  });
                }),
            SizedBox(
              height: 20.h,
            ),
            PaymentWidget(
                listImage: AppImages.mobileNumImg,
                text: "Mobile Number",
                isSelected: !onSelectItem,
                onTap: () {
                  setState(() {
                    onSelectItem = false;
                  });
                }),
            SizedBox(
              height: 30.h,
            ),
            CustomButton(
              btnText: "Next",
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SeekerEmailScreen()));
              },
            )
          ],
        ),
      ),
    );
  }
}
