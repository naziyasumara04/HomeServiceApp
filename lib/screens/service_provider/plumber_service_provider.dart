import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homeapp/core/constants/app_colors.dart';
import 'package:homeapp/core/constants/app_images.dart';
import 'package:homeapp/screens/service_provider/plumber_booking_map_screen.dart';
import 'package:homeapp/screens/service_provider/plumber_call_screen.dart';
import 'package:homeapp/widgets/custom_button.dart';
import 'package:star_rating/star_rating.dart';
import 'gallery_screen.dart';

class PlumberServiceProvider extends StatefulWidget {
  final String image;
  final String title;
  final String subTitle;

  const PlumberServiceProvider(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle});

  @override
  State<PlumberServiceProvider> createState() => _PlumberServiceProviderState();
}

class _PlumberServiceProviderState extends State<PlumberServiceProvider> {
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite; // Toggle state
    });
  }

  int? skillSelected;

  final List<Map<String, dynamic>> skillData = [
    {'text': 'Sink'},
    {'text': 'shower'},
    {'text': 'Boiler'},
    {'text': 'Toilet'}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: false, body: buildBody());
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          image(),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              children: [
                nameInfo(),
                SizedBox(
                  height: 20.h,
                ),
                card(),
                SizedBox(
                  height: 30.h,
                ),
                skill(),
                SizedBox(
                  height: 20.h,
                ),
                CustomButton(
                  btnText: "Book",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PlumberBookingMapScreen(
                                  image: widget.image,
                                  title: widget.title,
                                  subTitle: widget.subTitle,
                                )));
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                bio(),
                SizedBox(
                  height: 20.h,
                ),
                gallery(),
                SizedBox(
                  height: 20.h,
                ),
                review(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget image() {
    return Stack(
      children: [
        Container(
          height: 344.h,
          width: 375.w,
          decoration: BoxDecoration(
            color: Color.fromRGBO(234, 239, 244, 1),
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(32),
                bottomLeft: Radius.circular(32)),
          ),
          child: Image.asset(
            widget.image,
            height: 306.h,
            width: 198.w,
            scale: 0.3,
          ),
        ),
        Positioned(
          // right: 1,
          left: 30,
          top: 50,
          child: CircleAvatar(
            backgroundColor: AppColors.whiteColor,
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(Icons.arrow_back),
            ),
          ),
        ),
      ],
    );
  }

  Widget nameInfo() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(widget.title,
                  style: Theme.of(context).textTheme.displayLarge),
              Text(
                widget.subTitle,
                style: TextStyle(color: AppColors.darkGreyColor, fontSize: 18),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PlumberCallScreen(
                                image: widget.image,
                                title: widget.title,
                                subTitle: widget.subTitle,
                                fromNumber: '0044534332',
                                toNumber: '94930434399',
                              )));
                },
                child: CircleAvatar(
                  backgroundColor: Color.fromRGBO(234, 239, 244, 1),
                  child: Icon(
                    Icons.call,
                    color: AppColors.lightBlueColor,
                  ),
                ),
              ),
              SizedBox(
                width: 20.h,
              ),
              CircleAvatar(
                backgroundColor: Color.fromRGBO(234, 239, 244, 1),
                child: IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: AppColors.lightBlueColor,
                    // color: isFavorite ? Colors.red : Colors.grey, // Color change
                    // size: 40, // Adjust size if needed
                  ),
                  onPressed: toggleFavorite, // Call toggle function
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget card() {
    return Container(
      padding: EdgeInsets.all(16),
      height: 103.h,
      width: 327.w,
      decoration: BoxDecoration(
          color: AppColors.whiteColor, borderRadius: BorderRadius.circular(6)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppImages.ratingImg),
              Text(
                "4.8",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Text(
                "Rating",
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppImages.orderImg),
              Text(
                "56 Orders",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Text(
                "Completed",
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppImages.years),
              Text(
                "4 Years",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Text(
                "Experience",
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget skill() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Skills",
          style: Theme.of(context).textTheme.displayLarge,
        ),
        SizedBox(
          height: 10.h,
        ),
        Wrap(
          runSpacing: 8,
          spacing: 8,
          children: List.generate(skillData.length, (index) {
            final data = skillData[index];
            return SkillCard(
              cardText: data['text'],
            );
          }),
        )
      ],
    );
  }

  Widget bio() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Bio",
            style: Theme.of(context).textTheme.displayLarge,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            "I'm Emily Jani, a dedicated plumbing professional with a passion for delivering"
            " top notch service to ensure your home's plumbing "
            "runs smoothly. With years of hands-on experience.",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }

  Widget gallery() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Gallery",
                style: Theme.of(context).textTheme.displayLarge,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GalleryScreen()));
                },
                child: Text(
                  "View All",
                  style: TextStyle(
                      color: AppColors.lightBlueColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.asset(
                    AppImages.galleryImgOne,
                    height: 70.h,
                    width: 70.h,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.asset(
                    AppImages.galleryImgTwo,
                    height: 70.h,
                    width: 70.h,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.asset(
                    AppImages.galleryImgThree,
                    height: 70.h,
                    width: 70.h,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.asset(
                    AppImages.galleryImgFour,
                    height: 70.h,
                    width: 70.h,
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.asset(
                    AppImages.galleryImgFive,
                    height: 70.h,
                    width: 70.h,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.asset(
                    AppImages.galleryImgSix,
                    height: 70.h,
                    width: 70.h,
                    // fit: Fit,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget review() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10.h,
          ),
          Text("Review", style: Theme.of(context).textTheme.displayLarge),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    AppImages.joshPeter,
                    height: 24.h,
                    width: 24.w,
                  ),
                  SizedBox(
                    width: 5.h,
                  ),
                  Text(
                    "Josh Peter",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Text("12/12/2024"),
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          StarRating(
            mainAxisAlignment: MainAxisAlignment.start,
            length: 5,
            rating: 0,
            between: 5,
            starSize: 20,
            onRaitingTap: (rating) {
              // print('Clicked rating: $rating / $starLength');
              setState(() {
                // _rating = rating;
              });
            },
          ),
          Text(
            "Emily Jani exceeded my expectations! Quick, reliable,"
            " and fixed my plumbing "
            "issue with precision. Highly recommend.",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(AppImages.caleb),
                  SizedBox(
                    width: 5.h,
                  ),
                  Text("Caleb"),
                ],
              ),
              Text("12/12/2024")
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          StarRating(
            mainAxisAlignment: MainAxisAlignment.start,
            length: 5,
            rating: 0,
            between: 5,
            starSize: 20,
            onRaitingTap: (rating) {
              // print('Clicked rating: $rating / $starLength');
              setState(() {
                // _rating = rating;
              });
            },
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "Emily Jani exceeded my expectations! Quick, reliable, "
            "and fixed my plumbing issue with precision. Highly recommend.",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(AppImages.ethan),
                  SizedBox(
                    width: 5.h,
                  ),
                  Text("Ethan "),
                ],
              ),
              Text("12/12/2024"),
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          StarRating(
            mainAxisAlignment: MainAxisAlignment.start,
            length: 5,
            rating: 0,
            between: 5,
            starSize: 20,
            onRaitingTap: (rating) {
              // print('Clicked rating: $rating / $starLength');
              setState(() {
                // _rating = rating;
              });
            },
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            "Emily Jani exceeded my expectations! Quick, reliable,"
            " and fixed my plumbing issue with precision. "
            "Highly recommend.",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
          ),
          SizedBox(
            height: 200.h,
          ),
        ],
      ),
    );
  }
}

class SkillCard extends StatelessWidget {
  final String cardText;

  const SkillCard({super.key, required this.cardText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 66,
      height: 30.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6), color: AppColors.whiteColor),
      child: Center(
        child: Text(
          cardText,
          style: TextStyle(color: AppColors.lightBlueColor),
        ),
      ),
    );
  }
}
