import 'package:flutter/material.dart';
import 'package:homeapp/screens/auth/login/login_screen.dart';
import 'package:homeapp/screens/common/help_support_screen.dart';
import 'package:homeapp/screens/common/notification_screen.dart';
import 'package:homeapp/screens/payment/add_new_card_screen.dart';
import 'package:homeapp/screens/payment/payment_screen.dart';
import 'package:homeapp/screens/service_provider/profile_screen.dart';
import '../screens/auth/forget_password/forget_password_screen.dart';
import '../screens/auth/otp/otp_screen.dart';
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
  static const String paymentScreen="/paymentScreen";
  static const String addNewCardScreen="/addNewCardScreen";
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
    case AppRoutes.editSeekerProfile:
      return MaterialPageRoute(builder: (_) => EditSeekerProfile());
    case AppRoutes.notificationScreen:
      return MaterialPageRoute(builder: (_) => NotificationScreen());
    case AppRoutes.helpSupportScreen:
      return MaterialPageRoute(builder: (_) => HelpSupportScreen());

    case AppRoutes.paymentScreen:
      return MaterialPageRoute(builder: (_)=>PaymentScreen());

    case AppRoutes.addNewCardScreen:
      return MaterialPageRoute(builder: (_)=>AddNewCardScreen());
// Default route
    default:
      return MaterialPageRoute(builder: (_) => Container());
  }
}
