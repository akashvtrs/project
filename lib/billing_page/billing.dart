// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, avoid_print

import 'package:final_project1/billing_page/additems.dart';
import 'package:final_project1/billing_page/customer_details.dart';
import 'package:flutter/material.dart';


class Billing extends StatefulWidget {
  final String itemname;
  final String itemprice;
  final String itemquantity;
  final String itemdiscount;

  final String itemdiscountvaluecost;
  final String itemnettotal;
  final String itemtotalamount;

  const Billing(
      this.itemname,
      this.itemquantity,
      this.itemprice,
      this.itemdiscount,
      this.itemnettotal,
      this.itemdiscountvaluecost,
      this.itemtotalamount,
      {super.key});

  @override
  State<Billing> createState() => _BillingState();
}

class _BillingState extends State<Billing> {
  TextEditingController customername_controller = TextEditingController();
  TextEditingController price_controller = TextEditingController();
  TextEditingController finalamount_controller = TextEditingController();
  final customername = <String>[]; // Creates growable list.
  final customerphone = <String>[];
  final map = {};
  bool isCheckeds = false;
  bool bool_cont = false;
  Color? discountcontainercolor=Colors.blueAccent;
 
  List list_itemname = [];
  List list_itemquantity = [];
  List list_itemprice = [];
  List list_itemdiscount = [];
  List list_itemnettotal = [];
  List list_itemdiscountvaluecost = [];
  List list_itemtotalamount = [];

  additem_cl() {
    customername.add(customername_controller.text);
    customerphone.add(price_controller.text);
    print(customername);
    print(customerphone);
    Navigator.pop(
        context, MaterialPageRoute(builder: (context) => AddItems()));
  }

  show() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CustomerRecords(customername, customerphone),
        ));
  }

  @override
  void initState() {
    super.initState();
    finalamount_controller.text = widget.itemtotalamount;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 8.0, left: 8.0),
          child: Column(
            children: [
              Text("New Sale!!!!"),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: TextField(
                    controller: customername_controller,
                    decoration: InputDecoration(
                      labelText: "CUSTOMER ID",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: TextField(
                    controller: price_controller,
                    decoration: InputDecoration(
                      labelText: "PHONE NO",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      if (widget.itemname.isNotEmpty) {
                        bool_cont = !bool_cont;
                       
                      }
                      
                      
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.cyan.withOpacity(0.5),
                      border: Border.all(),
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    height: 40,
                    width: 400,
                    child: Row(
                      children: [
                        Icon(Icons.arrow_drop_down_circle_outlined,
                            color: Colors.white),
                        Text("Billed Items"),
                      ],
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: bool_cont,
                child: Container(
                  height: 300,
                  width: 400,
                  color: Colors.blueAccent,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Checkbox(
                              value: isCheckeds,
                              
                              onChanged: (bool? value) {
                                
                                setState(() {
                                  
                                 if (value == true) {
                                    discountcontainercolor =
                                        Colors.lightGreen;
                                        list_itemname.add(widget.itemname);
                                        list_itemquantity.add(widget.itemquantity);
                                        list_itemprice.add(widget.itemprice);
                                        list_itemdiscount.add(widget.itemdiscount);
                                        list_itemnettotal.add(widget.itemnettotal);
                                        list_itemdiscountvaluecost.add(widget.itemdiscountvaluecost);
                                        list_itemtotalamount.add(widget.itemtotalamount);
                                        
                                        print(list_itemname);
                                        print(list_itemquantity);
                                        print(list_itemprice);
                                        print(list_itemdiscount);
                                        print(list_itemnettotal);
                                        print(list_itemdiscountvaluecost);
                                        print(list_itemtotalamount);

                                        }
                                        isCheckeds = value!;
                                        if (value == false) {
                                          discountcontainercolor =
                                        Colors.redAccent;
                                        list_itemname.add(widget.itemname);
                                        list_itemquantity.add(widget.itemquantity);
                                        list_itemprice.add(widget.itemprice);
                                        list_itemdiscount.add(widget.itemdiscount);
                                        list_itemnettotal.add(widget.itemnettotal);
                                        list_itemdiscountvaluecost.add(widget.itemdiscountvaluecost);
                                        list_itemtotalamount.add(widget.itemtotalamount);
                                        print(list_itemname);
                                        print(list_itemquantity);
                                        print(list_itemprice);
                                        print(list_itemdiscount);
                                        print(list_itemnettotal);
                                        print(list_itemdiscountvaluecost);
                                        print(list_itemtotalamount);

                                                                    }
                                 
                                   
                                });
                              }),
                          Container(
                            width: 350,
                            color: discountcontainercolor,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 250,
                                      
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Item Name"),
                                          Text(":"),
                                          
                                        ],
                                      ),
                                    ),
                                    Text(widget.itemname),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 250,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Quantity"),
                                          Text(":"),
                                        ],
                                      ),
                                    ),
                                    Text(widget.itemquantity),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 250,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Price"),
                                          Text(":"),
                                        ],
                                      ),
                                    ),
                                    Icon(Icons.currency_rupee, size: 15),
                                    Text(widget.itemprice),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 250,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text("cost"),
                                          Text(":"),
                                        ],
                                      ),
                                    ),
                                    Icon(Icons.currency_rupee, size: 15),
                                    Text(widget.itemnettotal),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 250,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Discount(${widget.itemdiscount}%)"),
                                          Text(":"),
                                        ],
                                      ),
                                    ),
                                    Icon(Icons.currency_rupee, size: 15),
                                    Text(widget.itemdiscountvaluecost),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 250,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Total Amount"),
                                          Text("="),
                                        ],
                                      ),
                                    ),
                                    Icon(Icons.currency_rupee, size: 15),
                                    Text(widget.itemtotalamount),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.red,
                      fixedSize: Size(300, 20)),
                  onPressed: additem_cl,
                  icon: Icon(Icons.add),
                  label: Text("ADD ITEMS !!!!")),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total Amount"),
                  SizedBox(
                    width: 100,
                    child: TextField(
                      controller: finalamount_controller,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.currency_rupee),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                          value: isCheckeds,
                          onChanged: (bool? value) {
                            if (value == true) {
                              setState(() {
                                isCheckeds = value!;
                              });
                            }
                          }),
                      Text("Received"),
                    ],
                  ),
                  SizedBox(
                    width: 100,
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.currency_rupee),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: TextField(
                    decoration: InputDecoration(
                        labelText: "description",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ))),
              ),
              ElevatedButton(onPressed: additem_cl, child: Text("add")),
              ElevatedButton(
                  onPressed: show, child: Text("show_customer_detail")),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }

  Bill() {
    Container(
      height: 300,
      width: 400,
      color: Color.fromARGB(153, 0, 4, 255),
      child: Text("fdafasfdsa"),
    );
  }
}
