import 'package:flutter/material.dart';
import 'package:homeapp/screens/service_provider/map_screen.dart';
import 'package:homeapp/screens/service_provider/payment_method_provider_screen.dart';
import 'package:homeapp/screens/service_provider/provider_phone_num_screen.dart';
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
  int _curr = 0;

  List<Widget> _list = [];

  @override
  void initState() {
    super.initState();
    _list = [
      PhoneNumScreen(onNext: _goToNextPage),
      ProviderOtpScreen(onNext: _goToNextPage),
      MapScreenDemo(onNext: _goToNextPage),
      ServiceOffersScreen(onNext: _goToNextPage),
      ServiceWorkingHoursScreen(onNext: _goToNextPage),
      PaymentMethodProviderScreen(onNext: _goToNextPage),
      AddAccountDetailScreen(onNext: _goToNextPage),
      PricingRateScreen(onNext: _goToNextPage),
    ];
  }

  void _goToNextPage() {
    if (_curr < _list.length - 1) {
      controller.animateToPage(
        _curr + 1,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          SmoothPageIndicator(
              controller: controller, // PageController
              count: _list.length,
              effect: WormEffect(
                type: WormType.normal,
                radius: 20,
                dotHeight: 8.0,
                dotWidth: 8.0,
                activeDotColor: AppColors.lightBlueColor,
                dotColor: Colors.grey,
              ), // your preferred effect
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
        physics: NeverScrollableScrollPhysics(),
        // reverse: true,
        // physics: BouncingScrollPhysics(),
        controller: controller,
        pageSnapping: true,
        onPageChanged: (num) {
          setState(() {
            _curr = num;
          });
        },
      ),
    );
  }
}
