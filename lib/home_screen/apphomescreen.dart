// ignore_for_file: prefer_const_constructors, must_be_immutable, non_constant_identifier_names, unused_import, prefer_const_literals_to_create_immutables, avoid_web_libraries_in_flutter, unnecessary_string_interpolations

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
  final String name_Phone_No;
  final String name_Email;
  final String name_Address;
  final String name_Pincode;
  final String name_Business_Description;

  
  
  const Identities({super.key,required this.name_owner, required this.name_Business,required this.name_Phone_No,required this.name_Email,required this.name_Address,required this.name_Pincode,required this.name_Business_Description,required this.name_customername,required this.no_phoneno,required this.items_noofitems,required this.amount_totalamount,required this.bal_balance});

  @override
  State<Identities> createState() => _IdentitiesState();
}

class _IdentitiesState extends State<Identities> {
  bool savedcustomers_bool=false;
  bool nosavedcustomers_bool=true;
  double totalpayments=0.0;
  double pendingpayment=0.0;
  double companybalance=0.0;

  bool floatingboolvalue=true;
  
  @override
  void initState() {
    
    super.initState();
    widget.amount_totalamount.forEach((item) {
                        totalpayments+= double.parse(item);
                      });
                      
    widget.bal_balance.forEach((item) {
      pendingpayment+= double.parse(item);
    });
   
    companybalance=double.parse(totalpayments.toStringAsFixed(2))-double.parse(pendingpayment.toStringAsFixed(2));
    
    if (widget.name_customername.isNotEmpty) {
                savedcustomers_bool = !savedcustomers_bool;
                nosavedcustomers_bool=false;
              }else{
                nosavedcustomers_bool=true;
              }
    
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
       
          automaticallyImplyLeading: false,
        backgroundColor: Colors.blue.shade100,
        foregroundColor: Colors.blue.shade900,
        leading:  InkWell(
          onTap: () {
            Navigator.push(context, 
            MaterialPageRoute(builder: (context) => Details(
              name_owner: widget.name_owner,
              name_Business: widget.name_Business,
              name_Phone_No: widget.name_Phone_No,
              name_Email: widget.name_Email ,
              name_Address: widget.name_Address,
              name_Pincode: widget.name_Pincode,
              name_Business_Description: widget.name_Business_Description,



            )),

            );
          },
          child: Icon(Icons.home)),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
            
              children: [
                Text("${widget.name_Business}",overflow: TextOverflow.ellipsis,
                      ),
                Text("-${widget.name_owner}"),
              ],
            ),
          ],
        ),
        
        
      ),
  body: SingleChildScrollView(
  
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          
          
          
          InkWell(
            onTap: () {
              setState(() {
                if (widget.name_customername.isNotEmpty) {
                  savedcustomers_bool = !savedcustomers_bool;
                }
                
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom:8.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  border: Border.all(color: Colors.blue.shade900),
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                child: Row(
                  children: [
                    Icon(Icons.arrow_drop_down,color: Colors.blue.shade900),
                    Text("Saved Customers",style: TextStyle(color: Colors.blue.shade900,
                      
                    ),),
                  ],
                )),
            ),
          ),
          Visibility(
                  visible: nosavedcustomers_bool,
                  child: Row(
                    children: [
                      Icon(Icons.error,
                          color: Colors.red),
                      Text("No items in cart",style: TextStyle(
                        color: Colors.red
                      ),),
                    ],
                  ),
                ),
          Visibility(
            visible: savedcustomers_bool,
            child: AppHomeScreen(
    
                
                name_Phone_No: widget.name_Phone_No,name_Email: widget.name_Email,name_Address: widget.name_Address,name_Pincode: widget.name_Pincode,name_Business_Description: widget.name_Business_Description,
              name_Business: widget.name_Business,name_owner: widget.name_owner,name_customername:widget.name_customername, no_phoneno:widget.no_phoneno, items_noofitems:widget.items_noofitems, amount_totalamount:widget.amount_totalamount, bal_balance:widget.bal_balance
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Total No.of Customers:${widget.name_customername.length}",style: TextStyle(
                  fontWeight: FontWeight.bold
                )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text("Total Payments:",style: TextStyle(
                  fontWeight: FontWeight.bold
                )),
                    Icon(Icons.currency_rupee_rounded,color: Colors.black,
                    
          
                    ),
                    Text(totalpayments.toStringAsFixed(2),style: TextStyle(
                        fontWeight: FontWeight.bold
                    ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        Text("Pending Payment:",style: TextStyle(
                                          fontWeight: FontWeight.bold
                                        )),
                         Row(
                      children: [
                        Icon(Icons.currency_rupee_rounded,color: Colors.black,
                        
                        ),
                        Text(pendingpayment.toStringAsFixed(2),style: TextStyle(
                        fontWeight: FontWeight.bold
                    ))
                      ],
                    ),               
                      ],
                    ),
                    
                    
                  ],
                ),
              ),
                Divider(
                  color: Color.fromARGB(255, 229, 223, 214),
                )
              ,
              
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        Text("Company's Account Balance:",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          
                        ),),
                        Row(
                          children: [
                            
                            Icon(Icons.currency_rupee_rounded,color: Colors.black,
          
                        
                        ),
                        Text(companybalance.toStringAsFixed(2),style: TextStyle(
                        fontWeight: FontWeight.bold
                    )),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Billing(
                   [],[],[],[],[],[],[],name_owner:widget.name_owner,name_business:widget.name_Business,
                  name_Business_Description: widget.name_Business_Description,
                  name_Email: widget.name_Email,
                  name_Phone_No: widget.name_Phone_No,
                  name_Address: widget.name_Address,
                  name_Pincode: widget.name_Pincode,
                 

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
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all( Colors.blue.shade900),
              foregroundColor: MaterialStateProperty.all(Colors.white),
              overlayColor: MaterialStateProperty.all(Colors.blue.shade100),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                )
                
              )
            ),
            
            child:Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.person_add),
                Text("Add New Customer"),
              ],
            )
          ),
        ],
      ),
    ),
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
  final String name_owner;
  final String name_Business;
  final String name_Business_Description;
  final String name_Phone_No;
  final String name_Email;
  final String name_Address;
  final String name_Pincode;

  const AppHomeScreen({super.key,required this.name_Phone_No,required this.name_Email,required this.name_Address,required this.name_Pincode,required this.name_Business_Description,required this.name_owner, required this.name_Business,required this.name_customername,required this.no_phoneno,required this.items_noofitems,required this.amount_totalamount,required this.bal_balance});

  @override
  State<AppHomeScreen> createState() => _AppHomeScreenState();
}

class _AppHomeScreenState extends State<AppHomeScreen> {
  bool delete_bool=false;
  
  
  @override
  Widget build(BuildContext context) {
    return 
    SizedBox(
      
      height: 350,
      width: double.infinity,
      child: Scaffold(
        
        backgroundColor: Colors.blue.shade100,
        body: ListView.builder(
          itemCount: widget.name_customername.length,
          itemBuilder: (context, index) {
            
            return InkWell(
              onTap: () {
                setState(() {
                  delete_bool=!delete_bool;
                 
                });
                
              },
              child: Card(
               
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: Text("No.${index+1}")),
                    Text("Customer Name: ${widget.name_customername[index]}"),
                    Text("Phone No: ${widget.no_phoneno[index]}"),
                    Text("Purchased No. of Items: ${widget.items_noofitems[index]}"),
                    Row(
                  
                      children: [
                        Text("Total Amount:"),Icon(Icons.currency_rupee_rounded, size: 15),
                        Text(widget.amount_totalamount[index]),
                       ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          children: [
                            Text("Balance:"),
                            Row(
                              children: [
                                Icon(Icons.currency_rupee_rounded, size: 15),
                                Text(widget.bal_balance[index]),
                              ],
                            ),
                            
                          ],
                        ),
                       
                      ]
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0,bottom: 4.0),
                      child: Visibility(
                        visible: delete_bool,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton( 
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue.shade100,
                               
                              ),
                              onPressed: () {
                                setState(() {
                                  widget.name_customername.removeAt(index);
                                  widget.no_phoneno.removeAt(index);
                                  widget.items_noofitems.removeAt(index);
                                  widget.amount_totalamount.removeAt(index);
                                  widget.bal_balance.removeAt(index);
                                  delete_bool=!delete_bool;
                                  Navigator.push(context, 
                                  MaterialPageRoute(
                                    builder: (context) => Identities(
                                      name_customername: widget.name_customername,
                                      no_phoneno: widget.no_phoneno,
                                      items_noofitems: widget.items_noofitems,
                                      amount_totalamount: widget.amount_totalamount,
                                      bal_balance: widget.bal_balance,
                                      name_owner:widget.name_owner,
                                      name_Business:widget.name_Business,
                                      name_Business_Description: widget.name_Business_Description,
                                      name_Phone_No: widget.name_Phone_No,
                                      name_Email: widget.name_Email,
                                      name_Address: widget.name_Address,
                                      name_Pincode: widget.name_Pincode,

                                      


                                    )
                                  )
                                  );





                                });
                                
                              }       ,    
                              child: Row(
                                children: [
                                  Icon(Icons.delete,color: Colors.red,
                                    size: 15,
                                  ),
                                  Text("Delete",style: TextStyle(color: Colors.red),),
                                ],
                              ),),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue.shade100
                                ),
                                onPressed: (){
                                  setState(() {
                                      widget.bal_balance[index]="0.00";
                                      Navigator.push(context, 
                                      MaterialPageRoute(
                                        builder: (context) => Identities(name_owner: widget.name_owner, 
                                      name_Business: widget.name_Business,
                                       name_Phone_No:widget.name_Phone_No, 
                                       name_Email: widget.name_Email, 
                                       name_Address: widget.name_Address,
                                        name_Pincode: widget.name_Pincode, 
                                        name_Business_Description: widget.name_Business_Description, 
                                        name_customername: widget.name_customername, 
                                        no_phoneno: widget.no_phoneno, 
                                        items_noofitems: widget.items_noofitems, 
                                        amount_totalamount: widget.amount_totalamount,
                                         bal_balance: widget.bal_balance)

                                      )
                                      );
                                      
                                  });
                                },  
                              
                                child: Row(
                                  children: [
                                     Icon(Icons.verified,color: Colors.green.shade900,
                                    size: 15,
                                  ),
                                    Text("paid",style: TextStyle(color: Colors.green.shade900),),
                                  ],
                                ))
                          ],

                        ),
                      ),
                    ),
                   
                  ],
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}