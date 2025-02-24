import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homeapp/core/constants/app_images.dart';
import 'package:homeapp/screens/service_provider/electrician_provider_screen.dart';
import 'package:homeapp/widgets/custom_gridview.dart';

import '../../core/constants/app_colors.dart';

class AllServiceProviderScreen extends StatefulWidget {
  const AllServiceProviderScreen({super.key});

  @override
  State<AllServiceProviderScreen> createState() =>
      _AllServiceProviderScreenState();
}

class _AllServiceProviderScreenState extends State<AllServiceProviderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Service Providers"),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: Padding(
      padding: const EdgeInsets.all(14.0),

        child: Column(
          children: [
            electricianProviders(),
            SizedBox(height: 10.h,),
            plumberProviders(),
            SizedBox(height: 10.h,),
            carpenterProviders(),
            SizedBox(height: 10.h,),
            painterProviders(),
            SizedBox(height: 10.h,),
            cleanerProviders(),
            SizedBox(height: 10.h,),
            locksmithProviders(),
            SizedBox(height: 10.h,),
            moverProviders()
          ],
        ),
      ),
    );
  }

  Widget electricianProviders() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  AppImages.smallElectricianImg,
                  height: 24,
                  width: 24,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  "Electrician Providers",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) =>
                        const ElectricianProviderScreen(),
                  ),
                );
              },
              child: Text(
                "View all",
                style: TextStyle(
                  color: AppColors.lightBlueColor,
                ),
              ),
            ),
          ],
        ),
        CustomGridview(items: [
          {
            'imagepath': AppImages.electricianImg,
            'title': 'Jackson ',
            'subtitle': 'Electrician',
            'rating': '4.5'
          },
          {
            'imagepath': AppImages.electricianImg,
            'title': 'Emily jani',
            'subtitle': 'Electrician',
            'rating': '4.5'
          },
        ]),
      ],
    );
  }

  Widget plumberProviders() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(AppImages.smallPlumberImg),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  "Plumber Providers",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ],
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                "View all",
                style: TextStyle(
                  color: AppColors.lightBlueColor,
                ),
              ),
            ),
          ],
        ),
        CustomGridview(items: [
          {
            'imagepath': AppImages.electricianImg,
            'title': 'Ethan lita ',
            'subtitle': 'Plumber',
            'rating': '4.5'
          },
          {
            'imagepath': AppImages.electricianImg,
            'title': 'Isabella una',
            'subtitle': 'Plumber',
            'rating': '4.5'
          },
        ]),
      ],
    );
  }

  Widget carpenterProviders() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(AppImages.smallCarpenterImg),
                Text(
                  "Carpenter Providers",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ],
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                "View all",
                style: TextStyle(
                  color: AppColors.lightBlueColor,
                ),
              ),
            ),
          ],
        ),
        CustomGridview(items: [
          {
            'imagepath': AppImages.electricianImg,
            'title': 'Aiden  ',
            'subtitle': 'Carpenter',
            'rating': '4.5'
          },
          {
            'imagepath': AppImages.electricianImg,
            'title': 'Logan ',
            'subtitle': 'Carpenter',
            'rating': '4.5'
          },
        ]),
      ],
    );
  }

  Widget painterProviders() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(AppImages.smallPainterImg),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  "Painter Providers",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ],
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                "View all",
                style: TextStyle(
                  color: AppColors.lightBlueColor,
                ),
              ),
            ),
          ],
        ),
        CustomGridview(items: [
          {
            'imagepath': AppImages.electricianImg,
            'title': 'Lucas ',
            'subtitle': 'Painter',
            'rating': '4.5'
          },
          {
            'imagepath': AppImages.electricianImg,
            'title': 'Ethan',
            'subtitle': 'Painter',
            'rating': '4.5'
          },
        ]),
      ],
    );
  }

  Widget cleanerProviders() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(AppImages.smallCleanerImg),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  "Cleaner Providers",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ],
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                "View all",
                style: TextStyle(
                  color: AppColors.lightBlueColor,
                ),
              ),
            ),
          ],
        ),
        CustomGridview(items: [
          {
            'imagepath': AppImages.electricianImg,
            'title': 'Harper ',
            'subtitle': 'Cleaner',
            'rating': '4.5'
          },
          {
            'imagepath': AppImages.electricianImg,
            'title': 'Harper',
            'subtitle': 'Cleaner',
            'rating': '4.5'
          },
        ]),
      ],
    );
  }

  Widget locksmithProviders() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(AppImages.smallLockSmith),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  "LockSmith Providers",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ],
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                "View all",
                style: TextStyle(
                  color: AppColors.lightBlueColor,
                ),
              ),
            ),
          ],
        ),
        CustomGridview(items: [
          {
            'imagepath': AppImages.electricianImg,
            'title': 'Benjamin ',
            'subtitle': 'LockSmith',
            'rating': '4.5'
          },
          {
            'imagepath': AppImages.electricianImg,
            'title': 'Carter',
            'subtitle': 'LockSmith',
            'rating': '4.5'
          },
        ]),
      ],
    );
  }

  Widget moverProviders() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(AppImages.smallMoverImg),
                SizedBox(
                  width: 10.w,
                ),
                Text("Mover Providers",
                    style: Theme.of(context).textTheme.displayLarge),
              ],
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                "View all",
                style: TextStyle(
                  color: AppColors.lightBlueColor,
                ),
              ),
            ),
          ],
        ),
        CustomGridview(items: [
          {
            'imagepath': AppImages.electricianImg,
            'title': 'Jackson ',
            'subtitle': 'Mover',
            'rating': '4.5'
          },
          {
            'imagepath': AppImages.electricianImg,
            'title': 'Emily jani',
            'subtitle': 'Mover',
            'rating': '4.5'
          },
        ]),
      ],
    );
  }
}
