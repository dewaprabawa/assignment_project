import 'package:assignment_project/core/styles/ui_colors.dart';
import 'package:assignment_project/screens/home_screen.dart';
import 'package:assignment_project/screens/login_screen.dart';
import 'package:assignment_project/screens/profile_screen.dart';
import 'package:assignment_project/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (_, child) {
        return MaterialApp(
          title: 'Assignment Test',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: UIcolors.appSoftGray),
            useMaterial3: true,
          ),
          home: child,
        );
      },child: const HomeScreen(),
    );
  }
}

