import 'package:flutter/material.dart';
import 'package:homeapp/routes/route_generator.dart';
import 'package:homeapp/screens/common/home_screen.dart';
import 'package:homeapp/widgets/custom_button.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Feedback screen"),
          CustomButton(
            btnText: "Send",
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.dashboard);
            }
          ),
        ],
      ),
    );
  }
}
