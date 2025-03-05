import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homeapp/core/constants/app_colors.dart';
import 'package:homeapp/screens/service_provider/plumber_service_provider.dart';

class PlumberCallScreen extends StatefulWidget {
  final String image;
  final String title;
  final String subTitle;

  const PlumberCallScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle});

  @override
  State<PlumberCallScreen> createState() => _PlumberCallScreenState();
}

class _PlumberCallScreenState extends State<PlumberCallScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
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
        ),
      ),
    );
  }

  Widget callDetails() {
    return Column(
      children: [
        CircleAvatar(
            backgroundColor: Color.fromRGBO(234, 239, 244, 1),
            radius: 55,
            child: Image.asset(
              widget.image,
              height: 98,
              width: 98,
            )),
        SizedBox(
          height: 10.h,
        ),
        Text(
          widget.title,
          style: Theme.of(context).textTheme.displayLarge,
        ),
        SizedBox(
          height: 5.h,
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
        SizedBox(height: 30.h,),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PlumberServiceProvider(
                          image: widget.image,
                          title: widget.title,
                          subTitle: widget.subTitle,
                        )));
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
