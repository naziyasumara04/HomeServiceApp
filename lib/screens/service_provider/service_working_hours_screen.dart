import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homeapp/widgets/custom_button.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_images.dart';

class ServiceWorkingHoursScreen extends StatefulWidget {
  const ServiceWorkingHoursScreen({super.key});

  @override
  State<ServiceWorkingHoursScreen> createState() =>
      _ServiceWorkingHoursScreenState();
}

class _ServiceWorkingHoursScreenState extends State<ServiceWorkingHoursScreen> {
  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Service working hours",
                  style: TextStyle(
                      color: AppColors.darkGreyColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "From",
                    style: TextStyle(
                        color: AppColors.darkGreyColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              comCont(hintText: "HH:MM"),
              SizedBox(
                height: 20.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "To",
                  style: TextStyle(
                      color: AppColors.darkGreyColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              comCont(hintText: "HH:MM"),
              SizedBox(
                height: 30.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "How Do you want to receive order",
                  style: TextStyle(
                      color: AppColors.darkGreyColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              ServiceCont(
                text: 'Fixit',
                selectedItem: isSelected,
                onTap: () {
                  setState(() {
                    isSelected = true;
                  });
                },
              ),
              SizedBox(
                height: 10.h,
              ),
              ServiceCont(
                text: 'Client',
                selectedItem: !isSelected,
                onTap: () {
                  setState(() {
                    isSelected = false;
                  });
                },
              ),
              //add two widget here
              SizedBox(
                height: 20.h,
              ),
              CustomButton(
                btnText: "Next",
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget comCont({required final String hintText}) {
    return SizedBox(
      height: 56,
      width: 327,
      child: TextField(
        decoration: InputDecoration(
            hintText: hintText,
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
}

//made class here

class ServiceCont extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool selectedItem;

  const ServiceCont(
      {super.key,
      required this.text,
      required this.onTap,
      required this.selectedItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: 327,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color:
                selectedItem ? AppColors.lightBlueColor : AppColors.borderColor,
          )),
      child: ListTile(
        onTap: onTap,
        title: Row(
          children: [
            Text(
              "From ",
            ),
            Text(
              text,
              style: TextStyle(
                color: selectedItem
                    ? AppColors.lightBlueColor
                    : AppColors.darkGreyColor,
              ),
            )
          ],
        ),
        trailing: Icon(
          Icons.check,
          size: 12,
          color:
              selectedItem ? AppColors.lightBlueColor : AppColors.borderColor,
        ),
      ),
    );
  }
}
