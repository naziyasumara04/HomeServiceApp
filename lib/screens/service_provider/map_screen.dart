import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homeapp/widgets/custom_button.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_images.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30.h,
            ),
            Text(
              "Allow “FixIt” to use your location",
              style: TextStyle(
                  color: AppColors.darkGreyColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 18),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "We need to know your exact location so that\n Clients can find you easily near you.",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 10.h,
            ),
            Image.asset(AppImages.mapImg),
            SizedBox(
              height: 20.h,
            ),
            addressCont(),
            SizedBox(
              height: 20.h,
            ),
            comCont(hintText: 'Business Name'),
            SizedBox(
              height: 20.h,
            ),
            comCont(hintText: "Business Address"),
            SizedBox(
              height: 20.h,
            ),
            CustomButton(
              btnText: "Next",
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }

  Widget addressCont() {
    return Container(
      height: 84,
      width: 327,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: AppColors.borderColor, width: 1)),
      child: ListTile(
        title: Text(
          "Street no. 23 Ouch west road Alibagh, Alibagh, Ouch, 18750, Pakistan",
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
        ),
        leading: Icon(Icons.location_on),
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
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.borderColor)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.borderColor))),
      ),
    );
  }
}
