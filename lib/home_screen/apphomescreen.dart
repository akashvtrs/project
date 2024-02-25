// ignore_for_file: prefer_const_constructors, must_be_immutable, non_constant_identifier_names, unused_import, prefer_const_literals_to_create_immutables, avoid_web_libraries_in_flutter

import 'dart:js_util';
import 'package:final_project1/billing_page/additems.dart';
import 'package:final_project1/billing_page/billing.dart';
import 'package:final_project1/business_profile/details.dart';
import 'package:flutter/material.dart';

class Identities extends StatefulWidget {
  final String name_owner;
  final String name_Business;
  final List name_customername;
  final List no_phoneno;
  final List items_noofitems;
  final List amount_totalamount;
  final List bal_balance;
  const Identities({super.key,required this.name_owner, required this.name_Business,required this.name_customername,required this.no_phoneno,required this.items_noofitems,required this.amount_totalamount,required this.bal_balance});

  @override
  State<Identities> createState() => _IdentitiesState();
}

class _IdentitiesState extends State<Identities> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        
        
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
  body: AppHomeScreen(
    name_customername:widget.name_customername, no_phoneno:widget.no_phoneno, items_noofitems:widget.items_noofitems, amount_totalamount:widget.amount_totalamount, bal_balance:widget.bal_balance
  ),
     
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
  final List name_customername;
  final List no_phoneno;
  final List items_noofitems;
  final List amount_totalamount;
  final List bal_balance;
  const AppHomeScreen({super.key,required this.name_customername,required this.no_phoneno,required this.items_noofitems,required this.amount_totalamount,required this.bal_balance});

  @override
  State<AppHomeScreen> createState() => _AppHomeScreenState();
}

class _AppHomeScreenState extends State<AppHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      backgroundColor: Colors.red,
      body: ListView.builder(
        itemCount: widget.name_customername.length,
        itemBuilder: (context, index) {
          
          return Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Customer Name: ${widget.name_customername[index]}"),
                Text("Phone No: ${widget.no_phoneno[index]}"),
                Text("Purchased No. of Items: ${widget.items_noofitems[index]}"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        
                        Text("Total Amount:"),Icon(Icons.currency_rupee, size: 15),
                        Text(widget.amount_totalamount[index])
                      ],
                    ),
                   Row(
                     children: [
                      
                       Text("Balance:"),Icon(Icons.currency_rupee, size: 15),
                       Text(widget.bal_balance[index])
                     ],
                   ),],
                ),
               
              ],
            ),
          );
        }
      ),
    );
  }
}