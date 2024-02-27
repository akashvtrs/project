import 'dart:async';
import 'package:final_project1/splash_screen/splashscreen_2.dart';
import 'package:flutter/material.dart';
class SplashScreen1 extends StatefulWidget {
  const SplashScreen1({super.key});
  @override
  State<SplashScreen1> createState() => _SplashScreen1State();
}
class _SplashScreen1State extends State<SplashScreen1> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const SplashScreen2(),
          ));
    });
  }
  @override
  Widget build(BuildContext context) {
    return 
      Image.asset(
        "assets/images/customer.png",
      );
  }
}
