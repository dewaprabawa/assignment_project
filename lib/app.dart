import 'package:assignment_project/features/authentication/presentation/cubit/auth_cubit.dart';
import 'package:assignment_project/screens/home_screen.dart';
import 'package:assignment_project/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _StartUpPageState();
}

class _StartUpPageState extends State<App> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) { 
      context.read<AuthCubit>().isLoggin();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
      return Navigator(pages: [
        if (state.loggedInStatus == LoggedInStatus.starting)
         const MaterialPage(
              key:  ValueKey("starting"),
              child: Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              ))
        else if (state.loggedInStatus == LoggedInStatus.unauthenticated)
          const MaterialPage(
                key: ValueKey("login_screen"),
              child: LoginScreen())
        else if (state.loggedInStatus == LoggedInStatus.authenticated)
          const MaterialPage(
            key: ValueKey("home_screen"),
            child: HomeScreen(),
          )
        else
          const MaterialPage(
                key: ValueKey("login_screen"),
              child: LoginScreen())
      ], onPopPage: (route, result) => route.didPop(result));
    });
  }
}

