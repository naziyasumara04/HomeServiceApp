import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homeapp/core/constants/app_colors.dart';
import 'package:homeapp/screens/service_provider/plumber_service_provider.dart';

class PlumberCallScreen extends StatefulWidget {
  final String image;
  final String title;
  final String subTitle;
  final String fromNumber;
  final String toNumber;

  const PlumberCallScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle,
      required this.fromNumber,
      required this.toNumber});

  @override
  State<PlumberCallScreen> createState() => _PlumberCallScreenState();
}

class _PlumberCallScreenState extends State<PlumberCallScreen> {
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
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
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
        ),
      ),
    );
  }

  Widget _callDetails() {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Color.fromRGBO(234, 239, 244, 1),
          radius: 55,
          child: Image.asset(
            widget.image,
            height: 98,
            width: 98,
          ),
        ),
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
        Text("calling..."),
        Text(_formatDuration(_seconds)),
      ],
    );
  }

  bool isMuted = false;
  bool isSpeakerOn = false;
  bool isVideoOn = false;

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
          mainAxisAlignment: MainAxisAlignment.center,
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
                isVideoOn = !isVideoOn;
              });
            }, "Mute", isVideoOn, Icons.videocam),
          ],
        ),
        SizedBox(
          height: 30.h,
        ),
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
