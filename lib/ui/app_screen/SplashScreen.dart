import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:task_manager/data/shared_preferece_data.dart';
import 'package:task_manager/ui/app_screen/LoginScreen.dart';
import 'package:task_manager/ui/dashboard_screen.dart';
import '../../widgets/screen_background_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then((value) => checkUserAuthentication());

  }

  void checkUserAuthentication() async {
    final bool result = await SharedPrefData.checkLoginState();
    if (result) {
      SharedPrefData.getDataFromSharedPref();
      //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const Dashboard()),(route) => false);
      Get.offAll(const Dashboard(),predicate: (route)=>false);
    }else{
      //Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) => const Login()),(route) => false);
      Get.offAll(const Login(),predicate: (route)=>false);
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ScreenBackground(
        child:  Center(
            child: SvgPicture.asset(
              'assets/images/logo.svg',
              width: 150,
              fit: BoxFit.scaleDown,
            )),
      )
    );
  }
}

