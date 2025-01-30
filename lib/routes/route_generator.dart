import 'package:flutter/material.dart';
import '../features/splash/splash_screen.dart';

class AppRoutes {
  static const String splash = "/splash";
}

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/splash':
      return MaterialPageRoute(builder: (context) => SplashScreen());

// Default route
    default:
      return MaterialPageRoute(builder: (_) => Container());
  }
}
