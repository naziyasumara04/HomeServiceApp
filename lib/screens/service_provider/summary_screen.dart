import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homeapp/core/constants/app_colors.dart';
import 'package:homeapp/widgets/custom_button.dart';
import 'package:intl/intl.dart';
import '../../routes/route_generator.dart';
import '../../widgets/electrician_card.dart';

class SummaryScreen extends StatefulWidget {
  final String address;
  final String houseNo;
  final String streetNo;
  final DateTime selectedDate;

  const SummaryScreen(
      {super.key,
      required this.selectedDate,
      required this.address,
      required this.houseNo,
      required this.streetNo});

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  late TextEditingController addressController;
  late TextEditingController houseNoController;
  late TextEditingController streetNoController;

  @override
  void initState() {
    super.initState();
    addressController = TextEditingController(text: widget.address);
    houseNoController = TextEditingController(text: widget.houseNo);
    streetNoController = TextEditingController(text: widget.streetNo);
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
      padding: const EdgeInsets.all(14.0),
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
            ElectricianCard(),
            SizedBox(
              height: 10.h,
            ),
            review(),
            SizedBox(
              height: 100.h,
            ),
            CustomButton(
              btnText: 'Confirm',
              onTap: orderReceived,
            ),
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
              Text('${DateFormat('dd MMMM yyyy').format(widget.selectedDate)}',
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
