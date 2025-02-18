import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homeapp/core/constants/app_colors.dart';
import 'package:homeapp/core/constants/app_images.dart';
import 'package:homeapp/widgets/custom_listview.dart';
import 'package:homeapp/widgets/rating_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 14),
          child: Image.asset(
            AppImages.appLogo,
            width: 40,
            height: 33,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 14.0),
            child: Icon(Icons.call),
          ),
          // Image.asset(AppImages.appLogo)
        ],
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
        child: Column(
          children: [
            search(),
            popularServices(),
          ],
        ),
      ),
    );
  }

  Widget popularServices() {
    return Column(
      children: [
        //add linear gradient box here and also add search box here..
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("popular services",
              style:
              Theme.of(context).textTheme.displayLarge,),
            GestureDetector(
              onTap: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const RatingWidget(),
                  ),
                );
              },
              child: Text("view all"),
            ),
          ],
        ),

        CustomListview(
          items: [
            {
              'imagepath': AppImages.plumber,
              'text': 'Plumbing',
            },
            {
              'imagepath': AppImages.multiMeter,
              'text': 'Electric work',
            },
            {
              'imagepath': AppImages.solarEnergy,
              'text': 'Solar',
            },
          ],
        ),
      ],
    );
  }

  Widget search() {
    return SizedBox(
      height: 180.h,
      width: 327.w,
      child: Stack(clipBehavior: Clip.none, children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          height: 180.h,
          width: 327.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              gradient: LinearGradient(
                  colors: [AppColors.lightBlueColor, AppColors.darkBlueColor])),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Get 30% off",
                    style: TextStyle(
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 24.sp),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Just by Booking Home \nServices ",
                    style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
            right: 5,
            top: 0,
            child: SizedBox(
              height: 167.h,
              width: 134.w,
              child: Image.asset(
                AppImages.girlImg,
                width: 134.w,
                fit: BoxFit.cover,
              ),
            )),
        Positioned(
            bottom: 0,
            child: Container(
              height: 56.h,
              width: 327.w,
              padding: EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(6)),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.tune),
                  hintText: "search here",
                  enabledBorder: InputBorder.none,
                  border: InputBorder.none,
                ),
              ),
            ))
      ]),
    );
  }
}
