// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomerRecords extends StatefulWidget {
  List customername;
  List customerphone;
  CustomerRecords(this.customername, this.customerphone, {super.key});

  @override
  State<CustomerRecords> createState() => _CustomerRecordsState();
}

class _CustomerRecordsState extends State<CustomerRecords> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(widget.customername.toString()),
          Text(widget.customerphone.toString()),
        ],
      ),
    );
  }
}
