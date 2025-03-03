import 'package:flutter/material.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homeapp/core/constants/app_colors.dart';
import 'package:homeapp/core/constants/app_images.dart';
import 'package:homeapp/widgets/custom_button.dart';

import '../payment/payment_screen.dart';

class OrderStatusScreen extends StatefulWidget {
  const OrderStatusScreen({super.key});

  @override
  State<OrderStatusScreen> createState() => _OrderStatusScreenState();
}

class _OrderStatusScreenState extends State<OrderStatusScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Center(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("My Orders",
              style: Theme.of(context).appBarTheme.titleTextStyle),
          tabContainer(),
        ]),
      ),
    );
  }

  Widget tabContainer() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      width: 327.w,
      height: 663.h,
      decoration: BoxDecoration(color: AppColors.scaffoldBackgroundColor),
      child: Container(
        height: 55,
        width: 327,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.lightGreyColor,
              offset: Offset(2, 2), // Adjust for shadow position
              blurRadius: 4.0, // Softness of the shadow
              spreadRadius: 1.0, // Size of the shadow
            ),
          ],
        ),
        child: DefaultTabController(
          length: 3,
          child: ContainedTabBarView(
            tabs: [
              Buttons(
                text: 'Unpaid',
                isSelected: _selectedIndex == 0,
              ),
              Buttons(
                text: 'Paid',
                isSelected: _selectedIndex == 1,
              ),
              Buttons(
                text: 'Schedule',
                isSelected: _selectedIndex == 2,
              )
            ],
            views: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    unpaidCont(),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    paidCont(),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    scheduleCont(),
                  ],
                ),
              ),
            ],
            onChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },

            tabBarProperties: TabBarProperties(
              indicatorColor: Colors.transparent, // Removes the purple line
              isScrollable: false, // Prevents horizontal swipe
            ),
            // pageViewProperties: PageViewProperties(
            //   physics: NeverScrollableScrollPhysics(),
            // ),
          ),
        ),
      ),
    );
  }

  Widget unpaidCont() {
    return Column(
      children: [
        SizedBox(
          height: 20.h,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "You have not paid yet for bellow service",
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        OrderCard(
          text: "Plumber",
          image: AppImages.smallPlumberImg,
          height: 240.h,
          amount: '\$222.00',
          date: 'December 23, 2023',
          name: 'Emily jani',
          btnVal: true,
          buttonText: 'pay now',
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PaymentScreen()));
          },
        ),
      ],
    );
  }

  Widget paidCont() {
    return Column(
      children: [
        SizedBox(
          height: 20.h,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Paid Service",
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        OrderCard(
          image: AppImages.smallPlumberImg,
          text: 'Plumber',
          amount: "\$300",
          date: 'December 24, 2023',
          name: 'Emily jani',
          btnVal: false,
          height: 200,
        ),
        SizedBox(
          height: 20.h,
        ),
        OrderCard(
            image: AppImages.smallPainterImg,
            text: "Painter",
            amount: "\$600",
            date: "December 07, 2023",
            name: "Lucas",
            btnVal: false)
      ],
    );
  }

  Widget scheduleCont() {
    return Column(
      children: [
        SizedBox(
          height: 20.h,
        ),
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Upcoming Booking services",
              style: Theme.of(context).textTheme.displayLarge,
            )),
        SizedBox(
          height: 20.h,
        ),
        OrderCard(
          height: 268.h,
          image: AppImages.smallPlumberImg,
          text: 'Plumber',
          amount: "\$30/H",
          date: 'January 04, 2024',
          name: 'Emily jani',
          btnVal: true,
          buttonText: "Cancel Booking",
          row: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Arrival Time",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                "10:00AM",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        OrderCard(
          height: 268.h,
          image: AppImages.smallLockSmith,
          text: 'Locksmith',
          amount: "\$20/H",
          date: 'January 04, 2024',
          name: 'Benjamin',
          btnVal: true,
          buttonText: "Cancel Booking",
          row: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Arrival Time",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                "10:00AM",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Buttons extends StatelessWidget {
  final String text;
  final Color? textColor;
  final Color? backgroundColor;
  final bool isSelected;

  const Buttons(
      {super.key,
      required this.text,
      this.textColor,
      this.backgroundColor,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 43.h,
      width: 101.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: isSelected ? AppColors.lightBlueColor : AppColors.whiteColor,
          border: Border.all(
            color: AppColors.borderColor,
            width: 1,
          )),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
              color:
                  isSelected ? AppColors.whiteColor : AppColors.lightBlueColor),
        ),
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final double? height;
  final String? image;
  final String text;
  final String amount;
  final String date;
  final String name;
  final Widget? btn;
  final bool btnVal;
  final String? buttonText;
  final Widget? row;
  final VoidCallback? onTap;

  const OrderCard(
      {super.key,
      this.height,
      this.image,
      required this.text,
      required this.amount,
      required this.date,
      required this.name,
      this.btn,
      required this.btnVal,
      this.buttonText,
      this.row,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      height: height ?? 238.h,
      width: 327.w,
      decoration: BoxDecoration(
          color: AppColors.whiteColor, borderRadius: BorderRadius.circular(6)),
      child: Column(
        children: [
          Row(
            children: [
              image != null ? Image.asset(image!) : SizedBox(),
              SizedBox(
                width: 8.w,
              ),
              Text(
                text,
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ],
          ),
          Divider(),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Amount to pay",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(amount),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Booking date",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                date,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          row ?? SizedBox(),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "$text name",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                name,
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          btnVal
              ? CustomButton(
                  btnText: buttonText ?? '',
                  onTap: onTap,
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
