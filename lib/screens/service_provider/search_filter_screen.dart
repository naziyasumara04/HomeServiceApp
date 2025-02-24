import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_images.dart';
import '../../widgets/custom_button.dart';
import 'electric_service_screen.dart';

class SearchFilterScreen extends StatefulWidget {
  const SearchFilterScreen({super.key});

  @override
  State<SearchFilterScreen> createState() => _SearchFilterScreenState();
}

class _SearchFilterScreenState extends State<SearchFilterScreen> {
  int? selectedServiceIndex;
  bool availIndex = false;
  int? specializationIndex;
  int? experienceIndex;
  RangeValues _currentRating = const RangeValues(2, 4);
  RangeValues _currentPrice = const RangeValues(10, 250);

  // You can create a list of card details for simplicity
  final List<Map<String, dynamic>> serviceCardData = [
    {'text': 'All', 'width': 52.0},
    {'text': 'wiring', 'width': 69.0},
    {'text': 'repairs', 'width': 69.0},
    {'text': 'emergency', 'width': 69.0},
    {'text': 'installation', 'width': 106.0},
  ];

  final List<Map<String, dynamic>> availableCardData = [
    {
      'text': 'Electrician Urgently',
      'width': 175.0,
      'icon': Icons.check_circle
    },
    {'text': 'specific times', 'width': 175.0, 'icon': Icons.check_circle},
  ];

  final List<Map<String, dynamic>> experienceCardData = [
    {'text': 'All', 'width': 52.0},
    {'text': 'A year', 'width': 71.0},
    {'text': '2 year', 'width': 70.0},
    {'text': '3 year', 'width': 70.0},
    {'text': '4 year', 'width': 71.0},
    {'text': '5+ year', 'width': 79.0},
    {'text': '10+ year', 'width': 83.0},
  ];

  final List<Map<String, dynamic>> specializationCardData = [
    {'text': 'Residential', 'width': 99.0},
    {'text': 'Commercial', 'width': 108.0},
    {'text': 'HVAC', 'width': 67.0},
    {'text': 'Lighting', 'width': 80.0},
    {'text': 'Smart home installations', 'width': 185.0},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Search Filter"),
        ),
        body: buildBody());
  }

  Widget buildBody() {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Center(
        child: Column(
          children: [
            serviceType(),
            availableContainer(),
            ratingAndPricing(),
            experience(),
            specialization(),
            CustomButton(
              btnText: "Apply Filter",
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ElectricServiceScreen(
                            electricWidget: electricCard(
                                showButton: false, context: context))));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget serviceType() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Service Type",
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Wrap(
          spacing: 8.0, // Horizontal spacing between cards
          runSpacing: 8.0, // Vertical spacing between lines
          children: List.generate(serviceCardData.length, (index) {
            final data = serviceCardData[index];
            return SmallCommonCard(
              cardText: data['text'],
              cardWidth: (data['width'] as double).w,
              // Adjust if using a responsive package
              isSelected: selectedServiceIndex == index,
              onTap: () {
                setState(() {
                  selectedServiceIndex = index; // Only one selected at a time
                });
              },
            );
          }),
        ),
      ],
    );
  }

  Widget availableContainer() {
    return Column(
      children: [
        Text("Availability"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(availableCardData.length, (index) {
            final data = availableCardData[index];
            return SmallCommonCard(
                cardText: data['text'],
                cardWidth: data['width'],
                cardIcon: data['icon'],
                isSelected: availIndex = !availIndex,
                onTap: () {
                  setState(() {
                    availIndex = !availIndex;
                  });
                });
          }),
        ),
      ],
    );
  }

  Widget ratingAndPricing() {
    return Column(
      children: [
        Text("Rating"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text("0"), Text("5")],
        ),
        RangeSlider(
          min: 0,
          max: 5,
          inactiveColor: AppColors.darkGreyColor,
          activeColor:AppColors.lightBlueColor,
          divisions: 5,
          // Makes slider steps from 0 to 5
          values: _currentRating,
          labels: RangeLabels(
            _currentRating.start.round().toString(),
            _currentRating.end.round().toString(),
          ),
          onChanged: (RangeValues newRange) {
            setState(() {
              _currentRating = newRange;
            });
          },
        ),

        //rating line
        Text("Pricing"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("10\$"),
            Text("500\$"),
          ],
        ),
        RangeSlider(
          min: 10,
          max: 500,
          inactiveColor: AppColors.darkGreyColor,
          activeColor:AppColors.lightBlueColor,
          // divisions: 49, // Optional: divides range into steps of 10
          values: _currentPrice,
          labels: RangeLabels(
            '\$${_currentPrice.start.toStringAsFixed(0)}',
            '\$${_currentPrice.end.toStringAsFixed(0)}',
          ),
          onChanged: (RangeValues newRange) {
            setState(() {
              _currentPrice = newRange;
            });
          },
        ),
      ],
    );
  }

  Widget experience() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text("Experience level"),
          ],
        ),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: List.generate(experienceCardData.length, (index) {
            final data = experienceCardData[index];
            return SmallCommonCard(
                cardText: data['text'],
                cardWidth: data['width'],
                isSelected: experienceIndex == index,
                onTap: () {
                  setState(() {
                    experienceIndex = index;
                  });
                });
          }),
        )
      ],
    );
  }

  Widget specialization() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Specialization"),
          ],
        ),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: List.generate(specializationCardData.length, (index) {
            final data = specializationCardData[index];
            return SmallCommonCard(
                cardText: data['text'],
                cardWidth: data['width'],
                isSelected: specializationIndex == index,
                onTap: () {
                  setState(() {
                    specializationIndex = index;
                  });
                });
          }),
        )
      ],
    );
  }
}

class SmallCommonCard extends StatelessWidget {
  final IconData? cardIcon;
  final String cardText;
  final double cardWidth;
  final bool isSelected;
  final VoidCallback onTap;

  const SmallCommonCard(
      {super.key,
      this.cardIcon,
      required this.cardText,
      required this.cardWidth,
      required this.isSelected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: cardWidth,
        height: 30.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color:
                isSelected ? AppColors.lightBlueColor : AppColors.whiteColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (cardIcon != null) ...[
              Icon(cardIcon!,
                  size: 16,
                  color: isSelected
                      ? AppColors.whiteColor
                      : AppColors.lightBlueColor),
              SizedBox(
                width: 5.w,
              ),
            ],
            // cardIcon?SizedBox(width: 5.h,):SizedBox(width: 0,),
            Text(
              cardText,
              style: TextStyle(
                  color: isSelected
                      ? AppColors.whiteColor
                      : AppColors.lightBlueColor),
            ),
          ],
        ),
      ),
    );
  }
}

Widget electricCard({required bool showButton, required BuildContext context}) {
  return Container(
    height: showButton ? 276.h : 210.h,
    width: 327.w,
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
        color: AppColors.whiteColor, borderRadius: BorderRadius.circular(6)),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Electric Services",
              style: Theme.of(context).textTheme.displayLarge,
            ),
            Image.asset(AppImages.electricityMeter),
          ],
        ),
        SizedBox(
          height: 5.h,
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: AppColors.lightBlueColor,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  "4.8",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  "(76)",
                  style: TextStyle(
                    color: Color.fromRGBO(145, 145, 145, 1),
                  ),
                )
              ],
            ),
            Text(
              "\$20/hour",
              style: TextStyle(
                  color: AppColors.lightBlueColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 12),
            ),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(AppImages.alarmClock),
            Row(
              children: [
                Container(
                  height: 24.h,
                  width: 64.w,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(212, 224, 235, 1),
                        blurRadius: 4,
                        // spreadRadius: 1,
                        offset: Offset(1, 1), // Adjust shadow position
                      ),
                    ],
                  ),
                  child: InkWell(
                    child: Center(
                      child: Text(
                        "7:00 AM",
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  "To",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(145, 145, 145, 1),
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Container(
                  height: 24.h,
                  width: 64.w,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(212, 224, 235, 1),
                        blurRadius: 4,
                        // spreadRadius: 1,
                        offset: Offset(1, 1), // Adjust shadow position
                      ),
                    ],
                  ),
                  child: InkWell(
                    child: Center(
                      child: Text(
                        "10:00 AM",
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        showButton
            ? CustomButton(
                btnText: "Get this Services",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ElectricServiceScreen(
                                electricWidget: electricCard(
                                    showButton: false, context: context),
                              )));
                },
              )
            : SizedBox(),
      ],
    ),
  );
}
