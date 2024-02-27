// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

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
    Timer(const Duration(seconds:5), () {
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
      
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Image.asset("assets/images/app_icon.png", height: 50, width: 50),
          Column(
             children: [
               Text(
                    "Billing APP",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),Text(
                "Customer Billing App For Business",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                )
      
              ),
             ],
           ),
             ],
           ),
           
              
          Image.asset(
            "assets/images/profile_picture.jpg",
            height: 400,
            width: 400,
          ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Image.asset(
                    "assets/images/secure.gif",
                    height: 150,
                    width: 150,
                  ),
                  const Text("100% SECURE",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )
                  ),
                ],
              ),
              Image.asset(
                "assets/images/logo_icon.png",
                height: 150,
                width: 150,
              ),
            ],
          )
        ],
      ),
    );
  }
}
