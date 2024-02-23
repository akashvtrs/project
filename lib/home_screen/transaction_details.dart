// ignore_for_file: prefer_const_constructors, must_be_immutable, non_constant_identifier_names, unused_import

import 'package:final_project1/billing_page/additems.dart';
import 'package:final_project1/business_profile/details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionDetails extends StatefulWidget {
  String name;
  TransactionDetails(this.name, {super.key});

  @override
  State<TransactionDetails> createState() => _TransactionDetailsState();
}

class _TransactionDetailsState extends State<TransactionDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Details(),
                  ));
            },
            icon: Icon(CupertinoIcons.profile_circled)),
        title: Text(widget.name),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddItems(),
              ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
