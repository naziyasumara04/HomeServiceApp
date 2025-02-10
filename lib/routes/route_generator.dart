import 'package:flutter/material.dart';
import 'package:homeapp/screens/auth/login/login_screen.dart';
import 'package:homeapp/screens/common/help_support_screen.dart';
import 'package:homeapp/screens/common/notification_screen.dart';
import 'package:homeapp/screens/payment/add_new_card_screen.dart';
import 'package:homeapp/screens/payment/payment_screen.dart';
import 'package:homeapp/screens/service_provider/edit_provider_profile.dart';
import 'package:homeapp/screens/service_provider/phone_num_screen.dart';
import 'package:homeapp/screens/service_provider/profession_screen.dart';
import 'package:homeapp/screens/service_provider/profile_screen.dart';
import 'package:homeapp/screens/service_provider/provider_otp_screen.dart';
import 'package:homeapp/screens/service_provider/service_provider_screen.dart';
import 'package:homeapp/screens/service_provider/upgrade_screen.dart';
import 'package:homeapp/screens/service_provider/verification_screen.dart';
import 'package:homeapp/screens/service_seeker/my_profile_screen..dart';
import '../screens/auth/forget_password/forget_password_screen.dart';
import '../screens/auth/otp/otp_screen.dart';
import '../screens/common/account_setup_screen.dart';
import '../screens/success/success_screen.dart';
import '../screens/auth/signup/signup_screen.dart';
import '../screens/onboarding/splash_screen.dart';
import '../screens/service_seeker/dashboard_screen.dart';
import '../screens/service_seeker/edit_seeker_profile.dart';

class AppRoutes {
  static const String splash = "/splash";
  static const String signIn = "/login";
  static const String signup = "/signup";
  static const String otp = "/otp";
  static const String forgetPassword = "/forgetPassword";
  static const String otpSuccess = "/otpSuccess";
  static const String dashboard = "/dashboard";
  static const String profile = "/profile";
  static const String editSeekerProfile = "/editSeekerProfile";
  static const String notificationScreen = "/notificationScreen";
  static const String helpSupportScreen = "/helpSupportScreen";
  static const String paymentScreen = "/paymentScreen";
  static const String addNewCardScreen = "/addNewCardScreen";
  static const String myProfileScreen = "/myProfileScreen";
  static const String editProviderProfile = "/editProviderProfile";
  static const String profession = "/profession";
  static const String verification = "/verification";
  static const String upgrade = "/upgrade";
  static const String accountSetup = "/accountSetup";
  static const String serviceProvider = "/serviceProvider";
  static const String providerOtpScreen="/providerOtpScreen";
  // static const String phoneNumScreen="phoneNumScreen";
}

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.splash:
      return MaterialPageRoute(builder: (_) => SplashScreen());
    case AppRoutes.signIn:
      return MaterialPageRoute(builder: (_) => LoginScreen());
    case AppRoutes.signup:
      return MaterialPageRoute(builder: (_) => SignupScreen());
    case AppRoutes.otp:
      return MaterialPageRoute(builder: (_) => OtpScreen());
    case AppRoutes.forgetPassword:
      return MaterialPageRoute(builder: (_) => ForgetPasswordScreen());
    case AppRoutes.otpSuccess:
      return MaterialPageRoute(builder: (_) => OtpSuccessScreen());
    case AppRoutes.dashboard:
      return MaterialPageRoute(builder: (_) => DashboardScreen());
    case AppRoutes.profile:
      return MaterialPageRoute(builder: (_) => ProfileScreen());
    case AppRoutes.myProfileScreen:
      return MaterialPageRoute(builder: (_) => MyProfileScreen());
    case AppRoutes.editSeekerProfile:
      return MaterialPageRoute(builder: (_) => EditSeekerProfile());
    case AppRoutes.notificationScreen:
      return MaterialPageRoute(builder: (_) => NotificationScreen());
    case AppRoutes.helpSupportScreen:
      return MaterialPageRoute(builder: (_) => HelpSupportScreen());
    case AppRoutes.paymentScreen:
      return MaterialPageRoute(builder: (_) => PaymentScreen());
    case AppRoutes.addNewCardScreen:
      return MaterialPageRoute(builder: (_) => AddNewCardScreen());
    case AppRoutes.editProviderProfile:
      return MaterialPageRoute(builder: (_) => EditProviderProfile());
    case AppRoutes.profession:
      return MaterialPageRoute(builder: (_) => ProfessionScreen());
    case AppRoutes.verification:
      return MaterialPageRoute(builder: (_) => VerificationScreen());
    case AppRoutes.upgrade:
      return MaterialPageRoute(builder: (_) => UpgradeScreen());
    case AppRoutes.accountSetup:
      return MaterialPageRoute(builder: (_) => AccountSetupScreen());

    case AppRoutes.serviceProvider:
      return MaterialPageRoute(builder: (_) => ServiceProviderScreen());
    // case AppRoutes.phoneNumScreen:
    //   return MaterialPageRoute(builder: (_)=>PhoneNumScreen());
    case AppRoutes.providerOtpScreen:
      return MaterialPageRoute(builder: (_)=>ProviderOtpScreen());
// Default route
    default:
      return MaterialPageRoute(builder: (_) => Container());
  }
}

