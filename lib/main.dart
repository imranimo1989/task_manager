import 'package:flutter/material.dart';
import 'package:task_manager/ui/app_screen/LoginScreen.dart';
import 'package:task_manager/ui/app_screen/SplashScreen.dart';
import 'package:task_manager/ui/app_screen/email_verification_screen.dart';
import 'package:task_manager/ui/app_screen/pin_verification_screen.dart';
import 'package:task_manager/ui/app_screen/registration_screen.dart';
import 'package:task_manager/ui/app_screen/set_password_screen.dart';

void main() {
  runApp( Home('/Login'));
}

class Home extends StatelessWidget {
  String homeRoute;

  Home(this.homeRoute, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: homeRoute,
      routes: {
        "/SplashScreen":(context) => const SplashScreen(),
        '/Login': (context) => const Login(),
        '/Registration': (context) => const Registration(),
        '/ForgotPasswordAndEmailVerification': (context) => const ForgotPasswordAndEmailVerification(),
        '/PinVerification': (context) => const PinVerification(),
        '/SetPasswordAndVerify': (context) => const SetPasswordAndVerify(),
        '/email_verify': (context) => const ForgotPasswordAndEmailVerification(),
      },
    );
  }
}
