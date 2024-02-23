// ignore_for_file: unused_import, depend_on_referenced_packages

import 'package:final_project1/billing_page/additems.dart';
import 'package:final_project1/billing_page/billing.dart';
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
      home: const AddItems(),
    );
  }
}
