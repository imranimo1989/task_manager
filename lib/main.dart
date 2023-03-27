import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp( const Home());
}

class Home extends StatefulWidget {


  const Home( {super.key});

  static GlobalKey<NavigatorState> globalNavigatorKey = GlobalKey<NavigatorState>();

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: Home.globalNavigatorKey,
      debugShowCheckedModeBanner: false,

    );
  }
}
