import 'package:flutter/material.dart';
import 'package:task_manager/ui/app_screen/LoginScreen.dart';
import 'package:task_manager/ui/app_screen/SplashScreen.dart';
import 'package:task_manager/ui/app_screen/email_verification_screen.dart';

import 'package:task_manager/ui/app_screen/registration_screen.dart';
import 'package:task_manager/ui/app_screen/set_password_screen.dart';

void main() {
  runApp( const Home('/SplashScreen'));
}

class Home extends StatefulWidget {
  final String homeRoute;

  const Home(this.homeRoute, {super.key});

  static GlobalKey<NavigatorState> globalNavigatorKey = GlobalKey<NavigatorState>();

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Home.globalNavigatorKey,
      debugShowCheckedModeBanner: false,
      initialRoute: widget.homeRoute,
      routes: {
        "/SplashScreen":(context) => const SplashScreen(),
        '/Login': (context) => const Login(),
        '/Registration': (context) => const Registration(),
        '/ForgotPasswordAndEmailVerification': (context) =>const ForgotPasswordAndEmailVerification(),
        '/SetPasswordAndVerify': (context) => const SetPasswordAndVerify(),
        '/email_verify': (context) => const ForgotPasswordAndEmailVerification(),
      },
    );
  }
}
