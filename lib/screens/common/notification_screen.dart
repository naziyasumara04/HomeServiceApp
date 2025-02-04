import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homeapp/widgets/custom_button.dart';
import '../../core/constants/app_colors.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  void toggleSwitch(bool value) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.lightBlueColor),
          onPressed: () {
            Navigator.pop(context); // Go back
          },
        ),
        title: Text(
          "Notification",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.lightBlueColor),
        ),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          NotificationCard(
            notificationText: "General Notification",
            isSwitch: true,
            onChanged: (bool value) {
              setState(() {});
            },
          ),
          SizedBox(
            height: 10.h,
          ),
          NotificationCard(
            notificationText: "Sound",
            isSwitch: true,
            onChanged: (bool value) {
              setState(() {});
            },
          ),
          SizedBox(
            height: 10.h,
          ),
          NotificationCard(
            notificationText: "Vibrate",
            isSwitch: true,
            onChanged: (bool value) {
              setState(() {});
            },
          ),
          SizedBox(
            height: 10.h,
          ),
          NotificationCard(
            notificationText: "New Service",
            isSwitch: true,
            onChanged: (bool value) {
              setState(() {});
            },
          ),
          SizedBox(
            height: 10.h,
          ),
          NotificationCard(
            notificationText: "Payment",
            isSwitch: true,
            onChanged: (bool value) {
              setState(() {});
            },
          ),
          SizedBox(
            height: 240.h,
          ),
          CustomButton(
            btnText: "Save",
            onTap: () {},
          )
        ],
      ),
    );
  }
}

class NotificationCard extends StatefulWidget {
  final String notificationText;
  final bool isSwitch;
  final ValueChanged<bool> onChanged;

  const NotificationCard(
      {super.key,
      required this.notificationText,
      required this.isSwitch,
      required this.onChanged});

  @override
  State<NotificationCard> createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  late bool isSwitchOn; // Local state for the switch

  @override
  void initState() {
    super.initState();
    isSwitchOn =
        widget.isSwitch; // Initialize with the value from the parent widget
  }

  void toggleSwitch(bool value) {
    setState(() {
      isSwitchOn = value; // Update the local state
    });
    widget.onChanged(value); // Notify the parent widget about the change
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 56,
        width: 347,
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.notificationText,
              style: TextStyle(
                  color: AppColors.darkGreyColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 14),
            ),
            Switch(
              padding: EdgeInsets.symmetric(horizontal: 10),
              activeColor: AppColors.lightBlueColor,
              value: isSwitchOn,
              onChanged: toggleSwitch,
            ),
          ],
        ),
      ),
    );
  }
}
