import 'package:flutter/material.dart';
import 'package:homeapp/features/auth/forget_password/forget_password_screen.dart';
import 'package:homeapp/features/auth/otp/otp_screen.dart';
import 'package:homeapp/features/auth/otp/otp_success_screen.dart';
import 'package:homeapp/features/auth/signup/signup_screen.dart';
import '../features/auth/signin/signin_screen.dart';
import '../features/splash/splash_screen.dart';

class AppRoutes {
  static const String splash = "/splash";
  static const String signin = "/signin";
  static const String signup = "/signup";
  static const String otp = "/otp";
  static const String forgetpassword = "/forgetpassword";
  static const String otpsuccess="/otpsuccess";
}

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.splash:
      return MaterialPageRoute(builder: (_) => SplashScreen());
    case AppRoutes.signin:
      return MaterialPageRoute(builder: (_) => SigninScreen());
    case AppRoutes.signup:
      return MaterialPageRoute(builder: (_) => SignupScreen());
    case AppRoutes.otp:
      return MaterialPageRoute(builder: (_) => OtpScreen());
    case AppRoutes.forgetpassword:
      return MaterialPageRoute(builder: (_) => ForgetPasswordScreen());
    case AppRoutes.otpsuccess:
      return MaterialPageRoute(builder: (_)=>OtpSuccessScreen());

// Default route
    default:
      return MaterialPageRoute(builder: (_) => Container());
  }
}
