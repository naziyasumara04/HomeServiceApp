import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homeapp/widgets/custom_button.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_images.dart';

class ServiceOffersScreen extends StatefulWidget {
  const ServiceOffersScreen({super.key});

  @override
  State<ServiceOffersScreen> createState() => _ServiceOffersScreenState();
}

class _ServiceOffersScreenState extends State<ServiceOffersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Service Offer",
                  style: TextStyle(
                      color: AppColors.darkGreyColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                )),
            SizedBox(
              height: 20.h,
            ),
            ServiceField(
              hintText: "Select Your service",
              selectList: [
                DropDownValueModel(
                  name: "service1",
                  value: "service 1",
                ),
                DropDownValueModel(name: "service2", value: "service2")
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            ServiceField(hintText: "Select your Experience", selectList: [
              DropDownValueModel(name: "Exp1", value: "Exp1"),
              DropDownValueModel(name: "Exp2", value: "Exp2"),
            ]),
            SizedBox(
              height: 10.h,
            ),
            ServiceField(hintText: "Select Service Area", selectList: [
              DropDownValueModel(name: "service1", value: "service1"),
              DropDownValueModel(name: "service2", value: "Service2")
            ]),
            SizedBox(
              height: 100.h,
            ),
            CustomButton(
              btnText: "Next",
              onTap: () {},
            )
            // ServiceField(
            //   hintText: "Select Your service",
            // )
          ],
        ),
      ),
    );
  }
}

class ServiceField extends StatelessWidget {
  final String hintText;
  final VoidCallback? onTap;
  final List<DropDownValueModel> selectList;

  const ServiceField(
      {super.key,
      required this.hintText,
      this.onTap,
      required this.selectList});

  @override
  Widget build(BuildContext context) {
    return DropDownTextField(
      textFieldDecoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
              color: AppColors.darkGreyColor,
              fontWeight: FontWeight.w400,
              fontSize: 14),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.borderColor)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.borderColor)),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.borderColor))),
      dropDownItemCount: 3,
      dropDownList: selectList,
    );
  }
}
