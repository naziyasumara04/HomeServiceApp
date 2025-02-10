import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homeapp/widgets/custom_button.dart';
import '../../core/constants/app_colors.dart';

class AddAccountDetailScreen extends StatefulWidget {
  const AddAccountDetailScreen({super.key});

  @override
  State<AddAccountDetailScreen> createState() => _AddAccountDetailScreenState();
}

class _AddAccountDetailScreenState extends State<AddAccountDetailScreen> {
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
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Add account details",
                    style: TextStyle(
                      color: AppColors.darkGreyColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h,),
              comCont(hintText: 'Owner name'),
              SizedBox(height: 10.h,),
              comCont(hintText: 'NIC Number'),
              SizedBox(height: 10.h,),
              comCont(hintText: 'Phone number'),
              SizedBox(height: 10.h,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Align(
                  alignment: Alignment.centerLeft,

                    child: Text("NIC Expiry date",
                    style: TextStyle(
                      color: AppColors.darkGreyColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 14
                    ),)),
              ),
              SizedBox(height: 5.h,),
              comCont(hintText: 'DD/MM/YYYY'),
              SizedBox(height: 20.h,),
              CustomButton(
                btnText: "Next",
                onTap: () {},
              )
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
