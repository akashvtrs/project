// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, avoid_print, avoid_function_literals_in_foreach_calls


import 'package:final_project1/billing_page/additems.dart';
import 'package:final_project1/billing_page/listview_items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';




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
  TextEditingController paidamount_controller = TextEditingController();

  final customername = <String>[]; // Creates growable list.
  final customerphone = <String>[];
  final map = {};
  bool isCheckeds = false;
  bool bool_cont = true;
  bool bool_noitemsincart = false;
  Color? discountcontainercolor=Colors.blueAccent;

 
  List a_list_itemname = [];
  List a_list_itemquantity = [];
  List a_list_itemprice = [];
  List a_list_itemdiscount = [];
  List a_list_itemnettotal = [];
  List a_list_itemdiscountvaluecost = [];
  List a_list_itemtotalamount = [];
  double totalDiscountForAllItems = 0.0;
  double totalNetTotalForAllItems = 0.0;
  double totalAmountForAllItems = 0.0;
  String balance = "0.00";
  
  additem_cl() {
    customername.add(customername_controller.text);
    customerphone.add(price_controller.text);
    print(customername);
    print(customerphone);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddItems(
          widget.itemname,
       widget.itemquantity,
       widget.itemprice,
       widget.itemdiscount,
       widget.itemnettotal,
widget.itemdiscountvaluecost,
      widget.itemtotalamount,
        )));
  }

  show() {
   // Navigator.push(
   //     context,
   //     MaterialPageRoute(
   //       builder: (context) => AddItems(),
   //     ));
        print(widget.itemdiscountvaluecost);
        
       
}

   


  @override
  void initState() {
    super.initState();
   // finalamount_controller.text = widget.itemtotalamount;
   widget.itemdiscountvaluecost.forEach((item) {
                        totalDiscountForAllItems += double.parse(item);
                      });
                      print(totalDiscountForAllItems);
   widget.itemnettotal.forEach((item) {
  totalNetTotalForAllItems += double.parse(item);
});
widget.itemtotalamount.forEach((item) {
  totalAmountForAllItems += double.parse(item);
});

  paidamount_controller.text="0.00";       
   balance = totalAmountForAllItems.toStringAsFixed(2);       
   if (widget.itemname.isEmpty) {
     bool_noitemsincart=!bool_noitemsincart;
   }     
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
                    width: double.infinity,
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
                child: Column(
                  children: [
                    
                    Padding(
                      padding: const EdgeInsets.only(bottom :8.0),
                      child: Visibility(
                        visible: bool_noitemsincart,
                        child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 209, 227, 14).withOpacity(0.5),
                          border: Border.all(),
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        height: 20,
                        width: double.infinity,
                        child: Center(child: Text("NO Items In Cart")),
                                          ),
                      ),
                    ),
                    

                    ListItems(
                          itemname_l:widget.itemname,
                    itemquantity_l:         widget.itemquantity,
                    itemprice_l:            widget.itemprice,
                    itemdiscount_l:         widget.itemdiscount,
                    itemnettotal_l:         widget.itemnettotal,
                    itemdiscountvaluecost_l:widget.itemdiscountvaluecost,
                    itemtotalamount_l:      widget.itemtotalamount,
                        ),
                  ],
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
        // ListItems(itemnames:[widget.itemname.toString()]),
           Padding(
             padding: const EdgeInsets.only(top:8.0,bottom: 8.0),
             child: Container(
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.all(Radius.circular(8.0)),color: Colors.pink,
              ),
              width: double.infinity,
              height: 100,
              
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("No.of Items:"),
                      Text(widget.itemquantity.length.toString()),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Total discount amount:"),
                      Text(totalDiscountForAllItems.toString()),
                    ]
                  ),
                  Row(
                    children: [
                      Text("Total net amount:"),
                      Text(totalNetTotalForAllItems.toString()),
                    ]
                  )
                  
                ],
              )),
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
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),

                    ),
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                      
                        Icon(Icons.currency_rupee, size: 15),
                        Text(totalAmountForAllItems.toString()),
                      ],
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
                              setState(() {
                                if (value == false) {
                                paidamount_controller.text="0.00";  
                                balance=totalAmountForAllItems.toString();
                                }
                                
                                if (value == true) {
                                  paidamount_controller.text=totalAmountForAllItems.toString();
                                 balance=((double.parse(totalAmountForAllItems.toString())-double.parse(paidamount_controller.text)).toString());
                                }
                               
                                isCheckeds = value!;
                              });                 
                          }),
                      Text("Received"),
                    ],
                  ),
                  SizedBox(
                    width: 100,
                    child: TextField(
                      onChanged: (value) => {
                        setState(() {
                          if (paidamount_controller.text.isNotEmpty) {
                            balance = ((double.parse(totalAmountForAllItems.toString()) - double.parse(paidamount_controller.text)).toString());
                          }
                          
                        })
                      },
                      controller: paidamount_controller,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.currency_rupee),
                      ),
                    ),
                  )
                ],
              ),
              Divider(
                color: Colors.black,

              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                        decoration: BoxDecoration(
                          
                          border: Border.all(),
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  
                        ),
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                          
                            Icon(Icons.currency_rupee, size: 15),
                            Text(balance),
                          ],
                        ),
                      ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: SizedBox(
                  width: 300,
                  child: TextField(
                   
                    maxLines: null,

                    
                      decoration: InputDecoration( 
                        
                        contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                          labelText: "description",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          ))),
                ),
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
  
  

//    double sum = 0.0;
//  widget.itemdiscountvaluecost.forEach((item) {
//    sum += double.parse(item);
//  });
//  //Text(sum.toStringAsFixed(2));
//  print('Total sum:${sum.toStringAsFixed(2)}');
//  }
}
