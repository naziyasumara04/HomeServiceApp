// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:homeapp/routes/route_generator.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import '../../core/constants/app_colors.dart';
// import '../../core/constants/app_images.dart';
// import '../../widgets/custom_button.dart';
//
// class OnboardingScreen extends StatefulWidget {
//   const OnboardingScreen({super.key});
//
//   @override
//   State<OnboardingScreen> createState() => _OnboardingScreenState();
// }
//
// class _OnboardingScreenState extends State<OnboardingScreen> {
//   final PageController _controller = PageController();
//   // final selectedPage = 0;
//   bool lastPage=false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(colors: [
//             AppColors.lightBlueColor,
//             AppColors.darkBlueColor,
//           ]),
//         ),
//         child: Stack(
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
//               child: PageView(
//                 controller: _controller,
//                 pageSnapping: true,
//                 onPageChanged: (index) {
//
//                   setState(() {
//                     // selectedPage!=index;
//                     lastPage=(index==2);
//                   });
//
//                 },
//                 children: [
//                   CommonCont(
//                     contImg: AppImages.men,
//                     headText: "Welcome to FixIt",
//                     subText:
//                         "Discover a world of convenience and \n reliability. FixIt is your one stop solution \n for all your home service needs",
//                   ),
//                   CommonCont(
//                       contImg: AppImages.womenOne,
//                       headText: "Find Services",
//                       subText:
//                           "Browse and book a wide range of \n services from plumbing and electrical to \n appliance repair. We've got it all covered"),
//                   CommonCont(
//                       contImg: AppImages.womenTwo,
//                       headText: "Find Services",
//                       subText:
//                           "Browse and book a wide range of \n services from plumbing and electrical to\n appliance repair. We've got it all covered")
//
//                   // Cont2(),
//                   // Cont3(),
//                 ],
//               ),
//             ),
//             Container(
//               alignment: Alignment(-1, -0.85),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     SmoothPageIndicator(
//                         controller: _controller, // PageController
//                         count: 3,
//                         effect: WormEffect(
//                             dotWidth: 10.0, // Width of inactive dots
//                             dotHeight: 10.0, // Height of dots
//                             type: WormType.thin,
//                             // strokeWidth:1,
//                             // activeDotScale: 1.8,
//                           dotColor: AppColors.lightGreyColor,
//                           activeDotColor: AppColors.whiteColor
//                         ), // your preferred effect
//                         // onDotClicked: (index) {
//                         //   selectedPage != index;
//                         // }
//                         ),
//                     GestureDetector(
//                       onTap:(){
//                         // _controller.jumpTo(2);
//                         Navigator.pushNamed(context, AppRoutes.signIn);
//                       },
//
//                       child: Text(
//                         "Skip",
//                         style: TextStyle(
//                           fontSize: 14,
//                             fontWeight: FontWeight.w500,
//                             color: AppColors.whiteColor),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//
//             lastPage?
//             Container(
//               alignment: Alignment(0,0.85),
//                 child: CustomButton(btnText: "Get Started",onTap: (){
//                   Navigator.pushNamed(context, AppRoutes.signIn);
//                 },))
//                 :Container(
//                 alignment: Alignment(0,0.85),
//                 child: CustomButton(btnText: "Next",onTap: (){
//                   _controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
//                 },)),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class CommonCont extends StatelessWidget {
//   final String contImg;
//   final String headText;
//   final String subText;
//
//   const CommonCont(
//       {super.key,
//       required this.contImg,
//       required this.headText,
//       required this.subText});
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         children: [
//           SizedBox(
//             height: 120,
//           ),
//           Image.asset(contImg),
//           SizedBox(
//             height: 40.h,
//           ),
//           Text(
//             headText,
//             style: TextStyle(
//               color: AppColors.whiteColor,
//               fontSize: 28.sp,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//           SizedBox(
//             height: 20.h,
//           ),
//           Text(
//             subText,
//             textAlign: TextAlign.center,
//             style: TextStyle(color: AppColors.whiteColor, fontSize: 16),
//
//           ),
//
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homeapp/routes/route_generator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_images.dart';
import '../../widgets/custom_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  bool lastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.lightBlueColor,
              AppColors.darkBlueColor,
            ],
          ),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: PageView(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() {
                    lastPage = (index == 2);
                  });
                },
                children: [
                  CommonCont(
                    contImg: AppImages.men,
                    headText: "Welcome to FixIt",
                    subText:
                    "Discover a world of convenience and \n reliability. FixIt is your one-stop solution \n for all your home service needs.",
                  ),
                  CommonCont(
                    contImg: AppImages.womenOne,
                    headText: "Find Services",
                    subText:
                    "Browse and book a wide range of \n services from plumbing and electrical to \n appliance repair. We've got it all covered.",
                  ),
                  CommonCont(
                    contImg: AppImages.womenTwo,
                    headText: "Find Services",
                    subText:
                    "Browse and book a wide range of \n services from plumbing and electrical to \n appliance repair. We've got it all covered.",
                  ),
                ],
              ),
            ),
            Positioned(
              top: 40,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmoothPageIndicator(
                    controller: _controller,
                    count: 3,
                    effect: WormEffect(
                      dotWidth: 10.0,
                      dotHeight: 10.0,
                      type: WormType.thin,
                      dotColor: AppColors.lightGreyColor,
                      activeDotColor: AppColors.whiteColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.signIn);
                    },
                    child: Text(
                      "Skip",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 50,
              left: 0,
              right: 0,
              child: Center(
                child: CustomButton(
                  btnText: lastPage ? "Get Started" : "Next",
                  onTap: () {
                    if (lastPage) {
                      Navigator.pushNamed(context, AppRoutes.signIn);
                    } else {
                      _controller.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CommonCont extends StatelessWidget {
  final String contImg;
  final String headText;
  final String subText;

  const CommonCont({
    super.key,
    required this.contImg,
    required this.headText,
    required this.subText,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(contImg, width: 200.w, height: 200.h),
          SizedBox(height: 40.h),
          Text(
            headText,
            style: TextStyle(
              color: AppColors.whiteColor,
              fontSize: 28.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text(
              subText,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 16.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
