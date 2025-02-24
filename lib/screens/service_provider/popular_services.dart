import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homeapp/core/constants/app_colors.dart';
import 'package:homeapp/core/constants/app_images.dart';
import 'package:homeapp/widgets/custom_listview.dart';

class PopularServices extends StatefulWidget {
  const PopularServices({super.key});

  @override
  State<PopularServices> createState() => _PopularServicesState();
}

class _PopularServicesState extends State<PopularServices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Popular services"),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8.0),
        child: Column(
          children: [
            mainContainer(),
            cleanContainer(),
            homeContainer(),
            securityCont(),
            carContainer(),
            handymenContainer(),
            paintingContainer(),
            otherContainer()
          ],
        ),
      ),
    );
  }

  Widget mainContainer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 15.h,),
        Text("Maintenance",
          style: Theme.of(context).textTheme.displayLarge,),
        SizedBox(height: 10.h,),
        CustomListview(items: [
          {'imagepath': AppImages.airConditioner, 'text': "Air Condition"},
          {'imagepath': AppImages.multiMeter, 'text': "Electric work"},
          {'imagepath': AppImages.sidingRepair, 'text': "Siding Repair"},
          {'imagepath': AppImages.airConditioner, 'text': "Air Condition"},
        ]),
      ],
    );
  }

  Widget cleanContainer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 15.h,),
        Text("Cleaning",
          style: Theme.of(context).textTheme.displayLarge,),
        SizedBox(height: 10.h,),
        CustomListview(items: [
          {
            'imagepath': AppImages.homeFlooring,
            'text': "Home Flooring",
          },
          {'imagepath': AppImages.gutterImg, 'text': "Gutter"},
          {'imagepath': AppImages.carpetImg, 'text': "Carpet"},
          {
            'imagepath': AppImages.homeFlooring,
            'text': "Home Flooring",
          },
        ])
      ],
    );
  }

  Widget homeContainer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 15.h,),
        Text("Home Improvement",
          style: Theme.of(context).textTheme.displayLarge,),
        SizedBox(height: 10.h,),
        CustomListview(items: [
          {'imagepath': AppImages.drillingImg, "text": "Drilling"},
          {'imagepath': AppImages.lawnImg, 'text': 'Lawn'},
          {'imagepath': AppImages.weedImg, 'text': 'Weed Control'},
          {'imagepath': AppImages.drillingImg, "text": "Drilling"},
        ])
      ],
    );
  }

  Widget securityCont() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 15.h,),
        Text("Security",
          style: Theme.of(context).textTheme.displayLarge,),
        SizedBox(height: 10.h,),
        CustomListview(items: [
          {'imagepath': AppImages.cctvImg, 'text': 'Camera'},
          {'imagepath': AppImages.alarmImg, 'text': 'Burglar alarm'},
          {'imagepath': AppImages.lockImg, 'text': 'Sturdy lock'},
          {'imagepath': AppImages.cctvImg, 'text': 'Camera'},
        ])
      ],
    );
  }

  Widget carContainer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 15.h,),
        Text("Car Maintenance",
          style: Theme.of(context).textTheme.displayLarge,),
        SizedBox(height: 10.h,),
        CustomListview(items: [
          {'imagepath': AppImages.carWash, 'text': 'Car washer'},
          {'imagepath': AppImages.oilChange, 'text': 'Oil Change'},
          {'imagepath': AppImages.carBattery, 'text': 'Car Battery'},
          {'imagepath': AppImages.carWash, 'text': 'Car washer'},
        ])
      ],
    );
  }

  Widget handymenContainer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 15.h,),
        Text("Handyman Services",
          style: Theme.of(context).textTheme.displayLarge,),
        SizedBox(height: 10.h,),
        CustomListview(items: [
          {'imagepath': AppImages.furnitureImg, 'text': 'Furniture'},
          {'imagepath': AppImages.doorImg, 'text': 'Door'},
          {'imagepath': AppImages.shelvingImg, 'text': 'Shelving'},
          {'imagepath': AppImages.furnitureImg, 'text': 'Furniture'},
        ])
      ],
    );
  }

  Widget paintingContainer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 15.h,),
        Text("Painting Services",
          style: Theme.of(context).textTheme.displayLarge,),
        SizedBox(height: 10.h,),
        CustomListview(items: [
          {'imagepath': AppImages.interiorImg, 'text': 'Interior'},
          {
            'imagepath': AppImages.exteriorImg,
            'text': 'Exterior',
          },
          {'imagepath': AppImages.wallImg, 'text': 'Wall'},
          {
            'imagepath': AppImages.exteriorImg,
            'text': 'Exterior',
          },
        ])
      ],
    );
  }

  Widget otherContainer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 15.h,),
        Text(
          "Other container",
          style: Theme.of(context).textTheme.displayLarge,
        ),
        SizedBox(height: 10.h,),
        CustomListview(
          items: [
            {
              'imagepath': AppImages.dishWahImg,
              'text': 'Dish wash',
            },
            {'imagepath': AppImages.loadingImg, 'text': 'Loading'},
            {'imagepath': AppImages.cuttingImg, 'text': 'Cutting'},
            {
              'imagepath': AppImages.dishWahImg,
              'text': 'Dish wash',
            },
          ],
        ),
      ],
    );
  }
}
