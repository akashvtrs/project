import 'dart:async';

import 'package:final_project1/business_profile/details.dart';
import 'package:flutter/material.dart';


class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({super.key});

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Details(
              name_owner: "",
              name_Business: "",
              name_Phone_No: "",
              name_Email: "",
              name_Address: "",
              name_Pincode: "",
              name_Business_Description: "",
              
            ),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset("assets/images/icon_template.png", width: 120),
            const Column(
              children: [
                Text(
                  "BUSINESS NAME",
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  "Description about business name",
                  style: TextStyle(fontSize: 15),
                ),
              ],
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              "assets/images/profile_picture.jpg",
              height: 400,
              width: 400,
            ),
            const Text("Owner Name"),
            Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.red)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        "assets/images/secure.gif",
                        height: 150,
                        width: 150,
                      ),
                      const Text("100% SECURE"),
                    ],
                  ),
                  Image.asset(
                    "assets/images/logo_icon.png",
                    height: 150,
                    width: 150,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
