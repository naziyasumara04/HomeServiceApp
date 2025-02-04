import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homeapp/core/constants/app_colors.dart';
import 'package:homeapp/core/constants/app_images.dart';
import 'package:homeapp/routes/route_generator.dart';
import 'package:homeapp/widgets/custom_button.dart';
import '../../widgets/profile_card.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        children: [
          myProfileText(),
          SizedBox(
            height: 30.h,
          ),
          profile(),
          SizedBox(
            height: 30.h,
          ),
          profileContainer(),
          SizedBox(
            height: 20.h,
          ),
          changeProfile(),
          changeProfileCont()
        ],
      ),
    );
  }

  Widget myProfileText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "My Profile",
          style: TextStyle(
              color: AppColors.lightBlueColor,
              fontWeight: FontWeight.w600,
              fontSize: 18),
        ),
      ],
    );
  }

  Widget profile() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(AppImages.profileImg),
            // child: Image.asset(AppImages.profileImg)
          ),
          Text(
            "Mahrama",
            style: TextStyle(
                color: AppColors.darkGreyColor,
                fontSize: 18,
                fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }

  Widget profileContainer() {
    return Column(
      children: [
        ProfileCard(
          showCont: true,
          cardText: 'Edit Profile',
          cardImage: AppImages.editImg,
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.editSeekerProfile);
          },
        ),
        SizedBox(
          height: 5.h,
        ),
        ProfileCard(
            showCont: true,
            cardText: "Notification",
            cardImage: AppImages.notifyImg,
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.notificationScreen);
            }),
        SizedBox(
          height: 5.h,
        ),
        ProfileCard(
            showCont: true,
            cardText: "Payment Method",
            cardImage: AppImages.paymentImg,
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.paymentScreen);
            }),
        SizedBox(
          height: 5.h,
        ),
        ProfileCard(
            showCont: true,
            cardText: "Help & Support",
            cardImage: AppImages.helpImg,
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.helpSupportScreen);
            }),
        SizedBox(
          height: 5.h,
        ),
        ProfileCard(
            // showCont: true,
            cardText: "Logout",
            cardImage: AppImages.logoutImg,
            onTap: () {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              AppImages.logout,
                              height: 87,
                              width: 79,
                            ),
                            SizedBox(height: 10.h,),
                            Text(
                              "Logout",
                              style: TextStyle(
                                  color: AppColors.darkGreyColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18),
                            ),
                            SizedBox(height: 10.h,),
                            Text(
                              'Are you sure to logout?',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.darkGreyColor),
                            ),
                            SizedBox(height: 20.h,),
                            CustomButton(btnText: "Logout"),
                            SizedBox(height:20.h),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Text('Cancel',
                              style: TextStyle(
                                color: AppColors.lightBlueColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 14
                                // color: App
                              ),),
                            ),
                          ],
                        ))),
              );
            })
      ],
    );
  }

  Widget changeProfile() {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppImages.profileChangeImg,
            height: 24,
            width: 24,
          ),
          Text(
            "Change Profile to selling mode",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.darkGreyColor),
          )
        ],
      ),
    );
  }

  Widget changeProfileCont() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.profile);
      },
      child: Container(
        height: 56,
        width: 327,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: AppColors.lightBlueColor)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 24,
              width: 24,
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(AppImages.profileImg),
                // child: Image.asset(AppImages.profileImg)
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "Mahrama",
              style: TextStyle(
                  color: AppColors.lightBlueColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
