import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homeapp/core/theme/theme.dart';
import 'package:homeapp/routes/route_generator.dart';
import 'package:homeapp/screens/auth/forget_password/forget_password_screen.dart';

import 'api_practice_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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

          // home: ApiPracticeScreen(),
          onGenerateRoute: generateRoute,
        );
      },
    );
  }
}
