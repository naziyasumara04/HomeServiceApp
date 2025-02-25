import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homeapp/core/constants/app_colors.dart';
import 'package:homeapp/core/constants/app_images.dart';
import 'package:homeapp/screens/service_provider/select_service_screen.dart';

import '../../widgets/custom_list_card.dart';

class ElectricServiceScreen extends StatefulWidget {
  final Widget electricWidget;

  const ElectricServiceScreen({super.key, required this.electricWidget});

  @override
  State<ElectricServiceScreen> createState() => _ElectricServiceScreenState();
}

class _ElectricServiceScreenState extends State<ElectricServiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Electric Service"),
        ),
        body: buildBody());
  }

  Widget buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      child: Column(
        children: [
          electricServiceCard(),
          SizedBox(
            height: 20.h,
          ),
          electricCont(),
        ],
      ),
    );
  }

  Widget electricServiceCard() {
    return Container(
      child: widget.electricWidget,
    );
  }

  Widget electricCont() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "For what you need Electrician",
          style: Theme.of(context).textTheme.displayLarge,
        ),
        SizedBox(
          height: 10.h,
        ),
        CustomListCard(
          cardText: 'Wiring Installation',
          cardImage: AppImages.wiringImg,
          showCont: true,
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SelectServiceScreen()));
          },
        ),
        SizedBox(
          height: 10.h,
        ),
        CustomListCard(
            // cardColor:Colors.transparent,
            cardText: "Electrical Repairs",
            cardImage: AppImages.electricalImg,
            showCont: true),
        SizedBox(
          height: 10.h,
        ),
        CustomListCard(
            cardText: "Indoor Lighting Installation",
            cardImage: AppImages.lightImg,
            showCont: true),
        SizedBox(
          height: 10.h,
        ),
        CustomListCard(
            cardText: "Fixture Installation",
            cardImage: AppImages.fixtureImg,
            showCont: true),
      ],
    );
  }
}
