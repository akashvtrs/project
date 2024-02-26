// ignore_for_file: unused_import, depend_on_referenced_packages, prefer_const_literals_to_create_immutables

import 'package:final_project1/billing_page/additems.dart';
import 'package:final_project1/billing_page/billing.dart';
import 'package:final_project1/business_profile/details.dart';
import 'package:final_project1/home_screen/apphomescreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        
      ),
      debugShowCheckedModeBanner: false,
      home:   AddItems([],[],[],[],
        [],
        [],
        [],
        name_Business: "",
        name_owner: "",
        add_list_name_customername: [],
        add_list_no_phoneno: [],
        add_list_items_noofitems: [],
        add_list_amount_totalamount: [],
        add_list_bal_balance: [],
        customerid_cont: "",
        phoneno_cont: "",
          
        
      ),
    );
  }
}
