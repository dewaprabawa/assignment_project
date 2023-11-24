import 'dart:io';

import 'package:assignment_project/app.dart';
import 'package:assignment_project/bloc_debugger.dart';
import 'package:assignment_project/core/styles/ui_colors.dart';
import 'package:assignment_project/features/authentication/presentation/cubit/auth_cubit.dart';
import 'package:assignment_project/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DevHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}


void main() async {
  await ServiceLocator.take();

   HttpOverrides.global = DevHttpOverrides();
   Bloc.observer = BlocDebugger();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (_, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => service<AuthCubit>()),
          ],
          child: MaterialApp(
            title: 'Assignment Test',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: UIcolors.appSoftGray),
              useMaterial3: true,
            ),
            home: child,
          ),
        );
      },child: const App(),
    );
  }
}

