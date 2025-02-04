import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homeapp/widgets/custom_button.dart';

import '../../core/constants/app_colors.dart';

class AddNewCardScreen extends StatefulWidget {
  const AddNewCardScreen({super.key});

  @override
  State<AddNewCardScreen> createState() => _AddNewCardScreenState();
}

class _AddNewCardScreenState extends State<AddNewCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.lightBlueColor),
          onPressed: () {
            Navigator.pop(context); // Go back
          },
        ),
        title: Text(
          "Add new card",
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
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Column(
        children: [
          cardText(),
          SizedBox(
            height: 5.h,
          ),
          cardCont(),
          SizedBox(height: 220.h),
          CustomButton(
            btnText: "Save",
            onTap: (){},
          )
        ],
      ),
    );
  }

  Widget cardText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Select your payment method",
            style: TextStyle(
                color: AppColors.darkGreyColor,
                fontWeight: FontWeight.w500,
                fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget cardCont() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Column(
        children: [
          Align(alignment: Alignment.topLeft, child: Text("Card")),
          SizedBox(
            height: 5.h,
          ),
          CardField(
            width: 327,
            hintText: 'Credit Card',
            suffixIcon:
                IconButton(onPressed: () {}, icon: Icon(Icons.arrow_drop_down)),
          ),
          SizedBox(
            height: 10.h,
          ),
          Align(alignment: Alignment.topLeft, child: Text("Card Number")),
          SizedBox(
            height: 5.h,
          ),
          CardField(width: 327, hintText: "Enter 14 digit number"),
          SizedBox(
            height: 10.h,
          ),
          Align(alignment: Alignment.topLeft, child: Text("Card holder name")),
          SizedBox(
            height: 5.h,
          ),
          CardField(width: 327, hintText: "Enter Name"),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Card expiry date"),
                  SizedBox(
                    height: 5.h,
                  ),
                  CardField(width: 160, hintText: "DD/MM/YY")
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("CVV"),
                  SizedBox(
                    height: 5.h,
                  ),
                  CardField(width: 160, hintText: "0000")
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class CardField extends StatelessWidget {
  final double width;
  final String hintText;
  final IconButton? suffixIcon;

  const CardField(
      {super.key,
      required this.width,
      required this.hintText,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      width: width,
      decoration: BoxDecoration(
          // color: AppColors.darkGreyColor,
          ),
      child: TextField(
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
                color: AppColors.darkGreyColor,
                fontSize: 14,
                fontWeight: FontWeight.w400),
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: AppColors.borderColor)),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(width: 1, color: AppColors.borderColor))),
      ),
    );
  }
}
