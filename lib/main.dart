import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homeapp/core/theme/theme.dart';
import 'package:homeapp/routes/route_generator.dart';
import 'package:homeapp/shared_preference_demo.dart';

import 'demo_screen.dart';
import 'map_screen_demo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          theme: AppTheme.lightTheme,
          debugShowCheckedModeBanner: false,
          title: 'Fixit',
          initialRoute: "/splash",
          onGenerateRoute: generateRoute,
        );
      },
    );
  }
}
