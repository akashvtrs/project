// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, avoid_print


import 'package:final_project1/billing_page/additems.dart';
import 'package:flutter/material.dart';




class Billing extends StatefulWidget {
  final List itemname;
  final List itemprice;
  final List itemquantity;
  final List itemdiscount;

  final List itemdiscountvaluecost;
  final List itemnettotal;
  final List itemtotalamount;

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
 
  List a_list_itemname = [];
  List a_list_itemquantity = [];
  List a_list_itemprice = [];
  List a_list_itemdiscount = [];
  List a_list_itemnettotal = [];
  List a_list_itemdiscountvaluecost = [];
  List a_list_itemtotalamount = [];

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
          builder: (context) => AddItems(),
        ));
  }

   

  @override
  void initState() {
    super.initState();
   // finalamount_controller.text = widget.itemtotalamount;
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
                                        a_list_itemname.add(widget.itemname);
                                        a_list_itemquantity.add(widget.itemquantity);
                                        a_list_itemprice.add(widget.itemprice);
                                        a_list_itemdiscount.add(widget.itemdiscount);
                                        a_list_itemnettotal.add(widget.itemnettotal);
                                        a_list_itemdiscountvaluecost.add(widget.itemdiscountvaluecost);
                                        a_list_itemtotalamount.add(widget.itemtotalamount);
                                        
                                        print(a_list_itemname);
                                        print(a_list_itemquantity);
                                        print(a_list_itemprice);
                                        print(a_list_itemdiscount);
                                        print(a_list_itemnettotal);
                                        print(a_list_itemdiscountvaluecost);
                                    

                                        }
                                        isCheckeds = value!;
                                        if (value == false) {
                                          discountcontainercolor =
                                        Colors.redAccent;
                                        a_list_itemname.add(widget.itemname);
                                        a_list_itemquantity.add(widget.itemquantity);
                                        a_list_itemprice.add(widget.itemprice);
                                        a_list_itemdiscount.add(widget.itemdiscount);
                                        a_list_itemnettotal.add(widget.itemnettotal);
                                        a_list_itemdiscountvaluecost.add(widget.itemdiscountvaluecost);
                                        a_list_itemtotalamount.add(widget.itemtotalamount);
                                        print(a_list_itemname);
                                        print(a_list_itemquantity);
                                        print(a_list_itemprice);
                                        print(a_list_itemdiscount);
                                        print(a_list_itemnettotal);
                                        print(a_list_itemdiscountvaluecost);
                                        print(a_list_itemtotalamount);

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
                                   Text(widget.itemname[0]),
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
                                  //  Text(widget.itemquantity),
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
                                   // Text(widget.itemprice),
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
                                   // Text(widget.itemnettotal),
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
                                   // Text(widget.itemdiscountvaluecost),
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
                                   // Text(widget.itemtotalamount),
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
         //   ListViewItems(
         //     itemname: widget.itemname,
         //     itemquantity: widget.itemquantity,
         //     itemprice: widget.itemprice,
         //     itemdiscount: widget.itemdiscount,
         //     itemnettotal: widget.itemnettotal,
         //     itemdiscountvaluecost: widget.itemdiscountvaluecost,
         //     itemtotalamount: widget.itemtotalamount,
         //     

         //   )
           //  ListItems(itemnames:[widget.itemname.toString()]),
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
}

