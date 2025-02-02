import 'package:flutter/material.dart';
import 'package:homeapp/screens/auth/login/login_screen.dart';

import '../screens/auth/forget_password/forget_password_screen.dart';
import '../screens/auth/otp/otp_screen.dart';
import '../screens/auth/otp/otp_success_screen.dart';
import '../screens/auth/signup/signup_screen.dart';
import '../screens/onboarding/splash_screen.dart';
import '../screens/service_seeker/dashboard_screen.dart';


class AppRoutes {
  static const String splash = "/splash";
  static const String signin = "/login";
  static const String signup = "/signup";
  static const String otp = "/otp";
  static const String forgetpassword = "/forgetpassword";
  static const String otpsuccess="/otpsuccess";
  static const String dashboard="/dashboard";
}

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.splash:
      return MaterialPageRoute(builder: (_) => SplashScreen());
    case AppRoutes.signin:
      return MaterialPageRoute(builder: (_) => LoginScreen());
    case AppRoutes.signup:
      return MaterialPageRoute(builder: (_) => SignupScreen());
    case AppRoutes.otp:
      return MaterialPageRoute(builder: (_) => OtpScreen());
    case AppRoutes.forgetpassword:
      return MaterialPageRoute(builder: (_) => ForgetPasswordScreen());
    case AppRoutes.otpsuccess:
      return MaterialPageRoute(builder: (_)=>OtpSuccessScreen());
    case AppRoutes.dashboard:
      return MaterialPageRoute(builder: (_)=>DashboardScreen());

// Default route
    default:
      return MaterialPageRoute(builder: (_) => Container());
  }
}

