import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homeapp/core/constants/app_colors.dart';
import 'package:homeapp/core/constants/app_images.dart';
import 'package:homeapp/routes/route_generator.dart';
import 'package:homeapp/widgets/custom_button.dart';
import 'package:homeapp/widgets/payment_widget.dart';

class PricingRateScreen extends StatefulWidget {
  final VoidCallback onNext;
  const PricingRateScreen({super.key, required this.onNext});

  @override
  State<PricingRateScreen> createState() => _PricingRateScreenState();
}

class _PricingRateScreenState extends State<PricingRateScreen> {
  bool selectedItem = true;

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
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h,),
              Text("Pricing and rate",
              style: TextStyle(
                color: AppColors.darkGreyColor,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),),
              SizedBox(height: 30.h,),
              Text("How do you cost?",
              style: TextStyle(
                color: AppColors.darkGreyColor,
                fontSize: 14
              ),),
              SizedBox(height: 20.h,),
              PaymentWidget(
                  listImage: AppImages.hourImg,
                  text: "Hourly fee",
                  isSelected: selectedItem,
                  onTap: () {
                    setState(() {
                      selectedItem = true;
                    });
                  }),
              SizedBox(height: 10.h,),
              pricingField(suffixText: "\$/h"),
              SizedBox(height: 10.h,),
              PaymentWidget(
                  listImage: AppImages.flatFeeImg,
                  text: "Flat fee",
                  isSelected: !selectedItem,
                  onTap: () {
                    setState(() {
                      selectedItem = false;
                    });
                  }),
              SizedBox(height: 10.h,),
              pricingField(suffixText: "\$"),
              SizedBox(height: 10.h,),
              Text("More information(Optional)",
              style: TextStyle(
                color: AppColors.darkGreyColor
              ),),
              SizedBox(height: 10.h,),
              Container(
                height: 114,
                width: 327.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: AppColors.borderColor)),
                child: SizedBox(
                  height: 114,
                  width: 327.w,
                  child: TextField(
                      // expands: true,

                      decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Write here...",
                    contentPadding: EdgeInsets.only(top: 8, left: 12),
                  )),
                ),
              ),
              SizedBox(height: 30.h,),
              CustomButton(
                btnText: "Submit",
                onTap: () => showAppDialog(context),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget pricingField({required final String suffixText}) {
    return SizedBox(
      height: 56.h,
      width: 327.w,
      child: TextField(
        decoration: InputDecoration(
            hintText: "Amount",
            suffixText: suffixText,
            suffixStyle: TextStyle(color: AppColors.lightBlueColor),
            hintStyle: TextStyle(
                color: AppColors.darkGreyColor,
                fontWeight: FontWeight.w400,
                fontSize: 14),
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.borderColor)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.borderColor))),
      ),
    );
  }

  void showAppDialog(context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
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
                      "Application received",
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
                      "Your application for the service of plumping has received, you will  get conformation message from \nour staff",
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
      ),
    );
  }
}
