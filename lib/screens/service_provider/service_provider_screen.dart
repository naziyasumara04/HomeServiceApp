import 'package:flutter/material.dart';
import 'package:homeapp/screens/service_provider/map_screen.dart';
import 'package:homeapp/screens/service_provider/payment_method_provider_screen.dart';
import 'package:homeapp/screens/service_provider/phone_num_screen.dart';
import 'package:homeapp/screens/service_provider/pricing_rate_screen.dart';
import 'package:homeapp/screens/service_provider/provider_otp_screen.dart';
import 'package:homeapp/screens/service_provider/service_offers_screen.dart';
import 'package:homeapp/screens/service_provider/service_working_hours_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_images.dart';
import 'add_account_detail_screen.dart';

class ServiceProviderScreen extends StatefulWidget {
  const ServiceProviderScreen({super.key});

  @override
  State<ServiceProviderScreen> createState() => _ServiceProviderScreenState();
}

class _ServiceProviderScreenState extends State<ServiceProviderScreen> {
  PageController controller = PageController();

  List<Widget> _list = <Widget>[
    PhoneNumScreen(),
    ProviderOtpScreen(),
    MapScreen(),
    ServiceOffersScreen(),
    ServiceWorkingHoursScreen(),
    PaymentMethodProviderScreen(),
    AddAccountDetailScreen(),
    PricingRateScreen()
  ];
  int _curr = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          SmoothPageIndicator(
              controller: controller, // PageController
              count: 8,
              effect: WormEffect(
                type: WormType.normal,
                // expansionFactor: 3.0,
                radius: 20,
                // activeDotScale: 2.0,
                dotHeight: 8.0, // Adjust dot height
                dotWidth: 8.0, // Adjust dot width
                // type: WormType.thin, // Optional: Customize the worm effect
                activeDotColor: AppColors.lightBlueColor, // Change active dot color
                dotColor: Colors.grey, // Change inactive dot color
              ),// your preferred effect
              onDotClicked: (index) {})
        ],
        iconTheme: IconThemeData(color: AppColors.lightBlueColor),
        title: Image.asset(
          AppImages.appLogo,
          height: 24,
          width: 28,
        ),
      ),
      body: PageView(
        children: _list,
        scrollDirection: Axis.horizontal,
        // reverse: true,
        // physics: BouncingScrollPhysics(),
        controller: controller,
        onPageChanged: (num) {
          setState(() {
            _curr = num;
          });
        },
      ),
    );
  }
}
