import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homeapp/core/theme/theme.dart';
import 'package:homeapp/routes/route_generator.dart';
import 'package:homeapp/screens/common/home_screen.dart';
import 'package:homeapp/screens/service_seeker/city/location_access_screen.dart';
import 'package:homeapp/screens/service_seeker/feedback_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
          home: HomeScreen(),
          // initialRoute: "/splash",
          onGenerateRoute: generateRoute,
        );
      },
    );
  }
}
