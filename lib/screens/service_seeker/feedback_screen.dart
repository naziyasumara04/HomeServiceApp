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
      appBar: AppBar(
        title: Text("Give your Feedback"),
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
            Text("How was your experience with Fix it?"),
            CustomButton(
                btnText: "Send",
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.dashboard);
                }),
          ],
        ),
      ),
    );
  }
}
