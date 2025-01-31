import 'package:flutter/material.dart';
import 'package:homeapp/features/auth/login/login_screen.dart';
import 'package:homeapp/features/auth/signup/signup_screen.dart';
import '../features/splash/splash_screen.dart';

class AppRoutes {
  static const String splash = "/splash";
  static const String login = "/login";
  static const String signup="/signup";
}

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.splash:
      return MaterialPageRoute(builder: (_) => SplashScreen());
    case AppRoutes.login:
      return MaterialPageRoute(builder: (_)=>LoginScreen());
    case AppRoutes.signup:
      return MaterialPageRoute(builder: (_)=>SignupScreen());

// Default route
    default:
      return MaterialPageRoute(builder: (_) => Container());
  }
}
