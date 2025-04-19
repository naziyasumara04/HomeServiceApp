import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homeapp/core/constants/app_images.dart';
import 'package:homeapp/routes/route_generator.dart';
import '../../core/constants/app_colors.dart';

class CallScreen extends StatefulWidget {
  final String fromNumber;
  final String toNumber;

  const CallScreen(
      {super.key, required this.fromNumber, required this.toNumber});

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  late Timer _timer;
  int _seconds = 0;

  @override
  void initState() {
    _startTimer();
    super.initState();
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

  bool isSpeakerOn = false;
  bool isMuted = false;
  bool isVideOn = false;

  String _formatDuration(int seconds) {
    final hours = seconds ~/ 3600;
    final minutes = (seconds % 3600) ~/ 60;
    final secs = seconds % 60;
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    if (hours > 0) {
      return '${twoDigits(hours)}:${twoDigits(minutes)}:${twoDigits(secs)}';
    } else {
      return '${twoDigits(minutes)}:${twoDigits(secs)}';
    }
  }

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
        _callDetails(),
        SizedBox(
          height: 250.h,
        ),
        _callButtons(),
      ],
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
        SizedBox(
          height: 10.h,
        ),
        Text("Calling..."),
        Text(widget.toNumber),
        Text(_formatDuration(_seconds)),
      ],
    );
  }

  Widget _actionButton(
      VoidCallback onTap, String label, bool isActive, IconData icon) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Color.fromRGBO(234, 239, 244, 1),
            child: Icon(
              size: 30,
              icon,
              color:
                  isActive ? AppColors.lightBlueColor : AppColors.darkGreyColor,
            ),
          ),
          Text(label),
        ],
      ),
    );
  }

  Widget _callButtons() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _actionButton(() {
              setState(() {
                isMuted = !isMuted;
              });
            }, "Mute", isMuted, Icons.mic),
            SizedBox(
              width: 20.h,
            ),
            _actionButton(() {
              setState(() {
                isSpeakerOn = !isSpeakerOn;
              });
            }, "Speaker", isSpeakerOn, Icons.volume_up_outlined),
            SizedBox(
              width: 20.h,
            ),
            _actionButton(() {
              setState(() {
                isVideOn = !isVideOn;
              });
            }, "Video", isVideOn, Icons.videocam),
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
              Icons.call_end,
              size: 30,
              color: AppColors.whiteColor,
            ),
          ),
        )
      ],
    );
  }
}
