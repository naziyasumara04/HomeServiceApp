import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homeapp/core/constants/app_colors.dart';
import 'package:homeapp/core/constants/app_images.dart';
import 'package:homeapp/routes/route_generator.dart';
import 'package:homeapp/screens/service_provider/service_provider_screen.dart';
import 'package:homeapp/screens/service_seeker/service_seeker_screen.dart';
import 'package:homeapp/widgets/custom_button.dart';

class AccountSetupScreen extends StatefulWidget {
  const AccountSetupScreen({super.key});

  @override
  State<AccountSetupScreen> createState() => _AccountSetupScreenState();
}

class _AccountSetupScreenState extends State<AccountSetupScreen> {
  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.lightBlueColor),
        // leading: ,
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
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.h,
            ),
            Text(
              "I am",
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: AppColors.darkGreyColor,
                  fontSize: 48),
            ),
            SizedBox(
              height: 20.h,
            ),
            AccountCont(
              selectedItem: isSelected,
              onTap: () {
                setState(() {
                  isSelected = true;
                });
              },
              title: "Service Provider",
              subTitle: "I offer professional services.",
            ),
            SizedBox(
              height: 20.h,
            ),
            AccountCont(
              selectedItem: !isSelected,
              onTap: () {
                setState(() {
                  isSelected = false;
                });
              },
              title: "Looking for service",
              subTitle: "I am looking for home services.",
            ),
            SizedBox(
              height: 40.h,
            ),
            CustomButton(
              btnText: "Next",
              onTap: () {
                if (isSelected) {
                  Navigator.pushNamed(context, AppRoutes.serviceProvider);
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => ServiceProviderScreen()));
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ServiceSeekerScreen()));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

class AccountCont extends StatelessWidget {
  final String title;
  final String subTitle;
  final bool selectedItem;
  final VoidCallback onTap;

  const AccountCont(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.selectedItem,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 152,
        width: 327,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
                color: selectedItem
                    ? AppColors.lightBlueColor
                    : AppColors.borderColor,
                width: 1)),
        child: ListTile(
          onTap: onTap,
          contentPadding: EdgeInsets.symmetric(vertical: 35, horizontal: 20),
          title: Text(title),
          subtitle: Text(subTitle),
          trailing: Icon(
            Icons.check,
            size: 15,
            color:
                selectedItem ? AppColors.lightBlueColor : AppColors.borderColor,
          ),
        ));
  }
}


