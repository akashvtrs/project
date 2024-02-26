// ignore_for_file: prefer_const_constructors, must_be_immutable, non_constant_identifier_names, unused_import, prefer_const_literals_to_create_immutables, avoid_web_libraries_in_flutter

import 'dart:js_util';
import 'package:final_project1/billing_page/additems.dart';
import 'package:final_project1/billing_page/billing.dart';
import 'package:final_project1/business_profile/details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
  bool savedcustomers_bool=true;
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
        backgroundColor: Colors.blue.shade100,
        foregroundColor: Colors.blue.shade900,
        leading:  Icon(Icons.home,size: 30),
        title: Center(
          child: Text("VMK Enterprises Payments ", style: TextStyle(fontSize:
              20
              )),
        ),
      ),
  body: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        
        
        
        InkWell(
          onTap: () {
            setState(() {
              savedcustomers_bool = !savedcustomers_bool;
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom:8.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                border: Border.all(color: Colors.blue.shade100),
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
              child: Row(
                children: [
                  Icon(Icons.arrow_drop_down,color: Colors.blue.shade900),
                  Text("Saved Customers",style: TextStyle(color: Colors.blue.shade900),),
                ],
              )),
          ),
        ),
        Visibility(
          visible: savedcustomers_bool,
          child: AppHomeScreen(
            name_customername:widget.name_customername, no_phoneno:widget.no_phoneno, items_noofitems:widget.items_noofitems, amount_totalamount:widget.amount_totalamount, bal_balance:widget.bal_balance
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top:8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Total No.of Customers:"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text("Total Payments:"),
                    Icon(Icons.currency_rupee,color: Colors.black,
                    size: 20,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text("Pending Payment:"),
                    Icon(Icons.currency_rupee,color: Colors.black,
                    size: 20,
                    ),
                  ],
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Text("Company's Acccount Balance:"),
                        Icon(Icons.currency_rupee,color: Colors.black,
                    size: 20,
                    ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    ),
  ),
     
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Billing(
                   [],[],[],[],[],[],[],name_owner:widget.name_owner,name_business:widget.name_Business,
                    add_list_amount_totalamount: widget.amount_totalamount,
                  
                  
                  add_list_name_customername: widget.name_customername,
                  
                  add_list_no_phoneno: widget.no_phoneno,
                 
                  add_list_items_noofitems: widget.items_noofitems,
                  
                  add_list_bal_balance: widget.bal_balance,
                  customerid_cont: "",
                  phoneno_cont: "",

                  
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
    Container(
      color: Colors.blue,
      height: 350,
      width: double.infinity,
      child: Scaffold(
        
        backgroundColor: Colors.blue.shade100,
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
      ),
    );
  }
}