import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homeapp/core/constants/app_images.dart';
import 'package:homeapp/routes/route_generator.dart';
import '../../core/constants/app_colors.dart';

class CallScreen extends StatefulWidget {
  final String fromNumber;
  final String toNumber;

  const CallScreen({
    super.key,
    required this.fromNumber,
    required this.toNumber,
  });

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  late Timer _timer;
  int _seconds = 0;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _seconds++;
      });
    });
  }

  bool isMuted = false;
  bool isSpeakerOn = false;
  bool isVideoOn = false;

  String _formatDuration(int seconds) {
    final duration = Duration(seconds: seconds);
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return "${twoDigits(duration.inMinutes)}:${twoDigits(duration.inSeconds % 60)} minutes";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(height: 100.h),
            _callDetails(),
            const Spacer(),
            _callButtons(),
            SizedBox(height: 50.h),
          ],
        ),
      ),
    );
  }

  Widget _callDetails() {
    return Column(
      children: [
        CircleAvatar(
          radius: 60.r,
          backgroundColor: const Color.fromRGBO(234, 239, 244, 1),
          child: Image.asset(
            AppImages.appLogo,
            height: 80.h,
            width: 80.w,
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(height: 12.h),
        Text(
          "Calling...",
          style: TextStyle(fontSize: 18.sp, color: Colors.grey),
        ),
        SizedBox(height: 4.h),
        Text(
          widget.toNumber,
          style: TextStyle(fontSize: 14.sp),
        ),
        SizedBox(height: 6.h),
        Text(
          _formatDuration(_seconds),
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  Widget _callButtons() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _actionButton(Icons.mic_off, "Mute", isMuted, () {
              setState(() {
                isMuted = !isMuted;
              });
            }),
            _actionButton(Icons.volume_up, "Speaker", isSpeakerOn, () {
              setState(() {
                isSpeakerOn = !isSpeakerOn;
              });
            }),
            _actionButton(Icons.videocam, "Video", isVideoOn, () {
              setState(() {
                isVideoOn = !isVideoOn;
              });
            }),
          ],
        ),
        SizedBox(height: 40.h),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.dashboard);
          },
          child: CircleAvatar(
            radius: 40.r,
            backgroundColor: const Color.fromRGBO(220, 68, 55, 1),
            child: Icon(
              Icons.call_end,
              size: 30.sp,
              color: AppColors.whiteColor,
            ),
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          "End Call",
          style: TextStyle(fontSize: 14.sp, color: Colors.red),
        ),
      ],
    );
  }

  Widget _actionButton(
      IconData icon, String label, bool isActive, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 30.r,
            backgroundColor: isActive
                ? AppColors.lightBlueColor.withOpacity(0.2)
                : const Color.fromRGBO(234, 239, 244, 1),
            child: Icon(
              icon,
              size: 26.sp,
              color: isActive ? AppColors.lightBlueColor : Colors.grey,
            ),
          ),
          SizedBox(height: 6.h),
          Text(label, style: TextStyle(fontSize: 12.sp)),
        ],
      ),
    );
  }
}
