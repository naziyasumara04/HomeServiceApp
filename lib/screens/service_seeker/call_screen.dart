import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homeapp/core/constants/app_images.dart';
import 'package:homeapp/routes/route_generator.dart';
import 'package:homeapp/screens/common/home_screen.dart';

import '../../core/constants/app_colors.dart';

class CallScreen extends StatefulWidget {
  const CallScreen({super.key});

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Column(
      children: [
        SizedBox(
          height: 150.h,
        ),
        callDetails(),
        SizedBox(
          height: 250.h,
        ),
        callBtns(),
      ],
    );
  }

  Widget callDetails() {
    return Column(
      children: [
        CircleAvatar(
            backgroundColor: Color.fromRGBO(234, 239, 244, 1),
            radius: 55,
            child: Image.asset(
              AppImages.appLogo,
              height: 98,
              width: 98,
            )),
        SizedBox(
          height: 10.h,
        ),
        Text("02:28 minutes"),
      ],
    );
  }

  Widget callBtns() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Color.fromRGBO(234, 239, 244, 1),
                  child: Icon(
                    size: 30,
                    Icons.mic_off,
                    color: AppColors.lightBlueColor,
                  ),
                ),
                Text("Mute"),
              ],
            ),
            SizedBox(
              width: 20.h,
            ),
            Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Color.fromRGBO(234, 239, 244, 1),
                  child: Icon(
                    size: 30,
                    Icons.volume_up_outlined,
                    color: AppColors.lightBlueColor,
                  ),
                ),
                Text("Speaker"),
              ],
            ),
            SizedBox(
              width: 20.h,
            ),
            Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Color.fromRGBO(234, 239, 244, 1),
                  child: Icon(
                    size: 30,
                    Icons.videocam,
                    color: AppColors.lightBlueColor,
                  ),
                ),
                Text("Video"),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 30.h,
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.dashboard);
          },
          child: CircleAvatar(
            radius: 40,
            backgroundColor: Color.fromRGBO(220, 68, 55, 1),
            child: Icon(
              Icons.call,
              size: 30,
              color: AppColors.whiteColor,
            ),
          ),
        )
      ],
    );
  }
}
