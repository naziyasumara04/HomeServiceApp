import 'package:flutter/material.dart';
import 'package:homeapp/common/constants/app_colors.dart';

class OtpSuccessScreen extends StatefulWidget {
  const OtpSuccessScreen({super.key});

  @override
  State<OtpSuccessScreen> createState() => _OtpSuccessScreenState();
}

class _OtpSuccessScreenState extends State<OtpSuccessScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool isVerified = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 900),
      vsync: this,
    );

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    );

    // Simulating a successful verification
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        isVerified = true;
        _controller.forward();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: buildBody());
  }

  Widget buildBody() {
    return Column(
      children: [
        SizedBox(
          height: 50,
        ),
        successCheck(),
        successText()
      ],
    );
  }

  Widget successCheck() {
    return Center(
      child: isVerified
          ? ScaleTransition(
              scale: _scaleAnimation,
              child: Icon(
                Icons.check_circle,
                size: 150.0,
                color: AppColors.lightBlueColor,
              ),
            )
          : CircularProgressIndicator(), // Show loader before animation
    );
  }

  Widget successText() {
    return Text("Successfully verified");
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
