// import "package:flutter/material.dart";
// import "package:flutter_svg/flutter_svg.dart";
// import "package:homeapp/core/constants/app_images.dart";
// import "package:homeapp/screens/common/home_screen.dart";
// import "package:homeapp/screens/service_seeker/location_access_screen.dart";
// import "package:homeapp/screens/service_seeker/my_profile_screen..dart";
// import "package:homeapp/screens/service_seeker/order_status_screen.dart";
// import "package:salomon_bottom_bar/salomon_bottom_bar.dart";
//
// class DashboardScreen extends StatefulWidget {
//   const DashboardScreen({super.key});
//
//   @override
//   State<DashboardScreen> createState() => _DashboardScreenState();
// }
//
// class _DashboardScreenState extends State<DashboardScreen> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//
//   int _selectedIndex = 0;
//   final _pageController = PageController(initialPage: 0);
//
//   // PageController _pageController=PageController();
//
//   final List<Widget> bottomBarPages = const [
//     HomeScreen(),
//     LocationAccessScreen(),
//     OrderStatusScreen(),
//     MyProfileScreen(),
//   ];
//
//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       key: _scaffoldKey,
//       body: SafeArea(
//         child: PageView(
//           physics: NeverScrollableScrollPhysics(),
//           controller: _pageController,
//           children: bottomBarPages,
//           // onPageChanged: _onItemTapped,
//           onPageChanged: (index) {
//             setState(() {
//               index = _selectedIndex;
//             });
//           },
//         ),
//       ),
//       bottomNavigationBar: SalomonBottomBar(
//         items: [
//           SalomonBottomBarItem(
//             icon: SvgPicture.asset(
//               AppImages.homeIcon,
//               width: 24.0,
//             ),
//             title: Text("Home"),
//           ),
//           SalomonBottomBarItem(
//             icon: SvgPicture.asset(
//               AppImages.cityIcon,
//               width: 24.0,
//             ),
//             title: Text("City"),
//           ),
//           SalomonBottomBarItem(
//             icon: SvgPicture.asset(
//               AppImages.orderIcon,
//               width: 24.0,
//             ),
//             title: Text("Order"),
//           ),
//           SalomonBottomBarItem(
//             icon: SvgPicture.asset(
//               AppImages.profileIcon,
//               width: 24.0,
//             ),
//             title: Text("Profile"),
//           ),
//         ],
//         backgroundColor: Colors.white,
//         // curve: AppColors.darkGreyColor,
//         // colorSelected: AppColors.darkBlueColor,
//         currentIndex: _selectedIndex,
//         onTap: (index) {
//           setState(
//             () {
//               _selectedIndex = index;
//             },
//           );
//           _pageController.jumpToPage(index);
//         },
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homeapp/core/constants/app_images.dart';
import 'package:homeapp/screens/common/home_screen.dart';
import 'package:homeapp/screens/service_seeker/location_access_screen.dart';
// import 'package:homeapp/screens/service_seeker/my_profile_screen.dart';
import "package:homeapp/screens/service_seeker/my_profile_screen..dart";
import 'package:homeapp/screens/service_seeker/order_status_screen.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int _selectedIndex = 0;
  final _pageController = PageController(initialPage: 0);

  final List<Widget> bottomBarPages = const [
    HomeScreen(),
    LocationAccessScreen(),
    OrderStatusScreen(),
    MyProfileScreen(),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      body: SafeArea(
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: bottomBarPages,
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
      bottomNavigationBar: SalomonBottomBar(
        items: [
          SalomonBottomBarItem(
            icon: SvgPicture.asset(
              AppImages.homeIcon,
              width: 24.0,
            ),
            title: Text("Home"),
          ),
          SalomonBottomBarItem(
            icon: SvgPicture.asset(
              AppImages.cityIcon,
              width: 24.0,
            ),
            title: Text("City"),
          ),
          SalomonBottomBarItem(
            icon: SvgPicture.asset(
              AppImages.orderIcon,
              width: 24.0,
            ),
            title: Text("Order"),
          ),
          SalomonBottomBarItem(
            icon: SvgPicture.asset(
              AppImages.profileIcon,
              width: 24.0,
            ),
            title: Text("Profile"),
          ),
        ],
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          _pageController.jumpToPage(index);
        },
      ),
    );
  }
}
