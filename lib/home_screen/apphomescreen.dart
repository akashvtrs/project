// ignore_for_file: prefer_const_constructors, must_be_immutable, non_constant_identifier_names, unused_import, prefer_const_literals_to_create_immutables

import 'dart:js_util';

import 'package:final_project1/billing_page/additems.dart';
import 'package:final_project1/billing_page/billing.dart';
import 'package:final_project1/business_profile/details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Identities extends StatefulWidget {
  final String name_owner;
  final String name_Business;
  const Identities({super.key,required this.name_owner, required this.name_Business});

  @override
  State<Identities> createState() => _IdentitiesState();
}

class _IdentitiesState extends State<Identities> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        
        leading: IconButton(
            onPressed: () {
              Navigator.pop(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Details(),
                  ));
            },
            icon: Icon(CupertinoIcons.profile_circled)),
        title: Column(
          
          children: [
            Center(
              child: Text(widget.name_Business,style: TextStyle(
                fontSize:50,
                color: Colors.red
              ),),
            ),
            Center(
              child: Text("--${widget.name_owner}",style: TextStyle(
                color: Colors.blue)),
            ),
          ],
        ),
        
      ),
  body: AppHomeScreen(),
     
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Billing(
                   [],[],[],[],[],[],[],name_owner:widget.name_owner,name_business:widget.name_Business,
                ),
              ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
  

}

class AppHomeScreen extends StatefulWidget {
  const AppHomeScreen({super.key});

  @override
  State<AppHomeScreen> createState() => _AppHomeScreenState();
}

class _AppHomeScreenState extends State<AppHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      backgroundColor: Colors.red,
      body: Text("User Name"),
    );
  }
}