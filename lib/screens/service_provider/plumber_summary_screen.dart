import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homeapp/widgets/electrician_card.dart';
import 'package:intl/intl.dart';

import '../../core/constants/app_colors.dart';
import '../../routes/route_generator.dart';
import '../../widgets/custom_button.dart';

class PlumberSummaryScreen extends StatefulWidget {
  final String address;
  final String houseNo;
  final String streetNo;
  final String image;
  final String title;
  final String subTitle;
  final DateTime selectedDate;

  const PlumberSummaryScreen(
      {super.key,
      required this.address,
      required this.houseNo,
      required this.streetNo,
      required this.image,
      required this.title,
      required this.subTitle,
      required this.selectedDate});

  @override
  State<PlumberSummaryScreen> createState() => _PlumberSummaryScreenState();
}

class _PlumberSummaryScreenState extends State<PlumberSummaryScreen> {
  late TextEditingController addressController;
  late TextEditingController streetNoController;
  late TextEditingController houseNoController;

  @override
  void initState() {
    super.initState();
    addressController = TextEditingController(text: (widget.address));
    streetNoController = TextEditingController(text: (widget.streetNo));
    houseNoController = TextEditingController(text: (widget.houseNo));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Summary"),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Review Summary",
              style: Theme.of(context).textTheme.displayLarge,
            ),
            SizedBox(
              height: 10.h,
            ),
            ElectricianCard(
              text: widget.title,
              type: widget.subTitle,
              image: widget.image,
              height: 300,
            ),
            SizedBox(
              height: 20.h,
            ),
            review(),
            SizedBox(
              height: 20.h,
            ),
            CustomButton(
              btnText: "Confirm",
              onTap: orderReceived,
            )
          ],
        ),
      ),
    );
  }

  Widget review() {
    return Container(
      padding: EdgeInsets.all(16),
      height: 191.h,
      width: 327.w,
      decoration: BoxDecoration(
          color: AppColors.whiteColor, borderRadius: BorderRadius.circular(6)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Address",
                  style: TextStyle(color: AppColors.borderColor, fontSize: 12)),
              Text(
                  'Street no. ${streetNoController.text},${addressController.text},${houseNoController.text}'),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Booking Date",
                  style: TextStyle(color: AppColors.borderColor, fontSize: 12)),
              Text(DateFormat('dd MMMM yyyy').format(widget.selectedDate),
                  style:
                      TextStyle(color: AppColors.darkGreyColor, fontSize: 12)),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Booking Hours",
                  style: TextStyle(color: AppColors.borderColor, fontSize: 12)),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Divider(),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total"),
              Text("\$20/H"),
            ],
          ),
        ],
      ),
    );
  }

  void orderReceived() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            actions: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Container(
                    height: 300.h,
                    width: 327.w,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.check_circle,
                          size: 70,
                          color: AppColors.lightBlueColor,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "Order received",
                          style: TextStyle(
                              color: AppColors.darkGreyColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          "Your order for the service of Electrician has received, The service Provider will arrived at 10:00AM.",
                          style: TextStyle(
                              color: AppColors.darkGreyColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 14),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomButton(
                          btnText: "Home",
                          onTap: () {
                            Navigator.pushNamed(context, AppRoutes.dashboard);
                          },
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        });
  }
}

// Text(
// '${addressController.text},${streetNoController.text},${houseNoController.text}'),
// Text(widget.subTitle),
// Text(widget.title),
// Image.asset(widget.image),
// Text('${DateFormat('MMMM/DD/yy').format(widget.selectedDate)}')
