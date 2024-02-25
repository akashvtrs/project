// ignore_for_file: non_constant_identifier_names, must_be_immutable, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'dart:html';

import 'package:final_project1/billing_page/billing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class ListItems extends StatefulWidget {
  List itemname_l=[""];
  List itemquantity_l=[""];
  List itemprice_l=[""];
  List itemdiscount_l=[""];
  List itemnettotal_l=[""];
  List itemdiscountvaluecost_l=[""];
  List itemtotalamount_l=[""];

   ListItems({super.key, required  this.itemname_l, required this.itemquantity_l, required this.itemprice_l, required this.itemdiscount_l, required this.itemnettotal_l, required this.itemdiscountvaluecost_l, required this.itemtotalamount_l});

  @override
  State<ListItems> createState() => _ListItemsState();
}

class _ListItemsState extends State<ListItems> {
  bool delete_visibility_value=false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height:320,
      width: double.infinity,
      color: Colors.red,
      
      child: ListView.builder(
          
          itemCount: widget.itemname_l.length,
          itemBuilder: (context, index) {
            
            return InkWell(
              onTap: () {
                setState(() {
                   delete_visibility_value=!delete_visibility_value;
                });
               
              },
              
              child: Column(
                children: [
                  Card(
                    child: Column(
                      children: [
                      
                        Column(
                          children: [
                            Text("No.${index+1}"),
                            Row(
                              children: [
                                SizedBox(
                                  width: 100,
                                                            
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Item Name"),
                                      Text(":"),
                                      
                                    ],
                                  ),
                                ),
                               Text(widget.itemname_l[index]),
                               
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 100,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Quantity"),
                                      Text(":"),
                                    ],
                                  ),
                                ),
                               Text(widget.itemquantity_l[index]),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 100,
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
                                Text(widget.itemprice_l[index]),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 100,
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
                                Text(widget.itemnettotal_l[index]),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 100,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Discount(${widget.itemdiscount_l[index]}%)"),
                                      Text(":"),
                                    ],
                                  ),
                                ),
                                Icon(Icons.currency_rupee, size: 15),
                                Text(widget.itemdiscountvaluecost_l[index]),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 100,
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
                               Text(widget.itemtotalamount_l[index]),
                               
                              ],
                            ),
                            Visibility(
                              visible: delete_visibility_value,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(onPressed: (){
                                    setState(() {
                                      widget.itemname_l.remove(widget.itemname_l[index]);
                                      widget.itemdiscount_l.remove(widget.itemdiscount_l[index]);
                                      widget.itemquantity_l.remove(widget.itemquantity_l[index]);
                                      widget.itemprice_l.remove(widget.itemprice_l[index]);
                                      widget.itemnettotal_l.remove(widget.itemnettotal_l[index]);
                                      widget.itemdiscountvaluecost_l.remove(widget.itemdiscountvaluecost_l[index]);
                                      widget.itemtotalamount_l.remove(widget.itemtotalamount_l[index]);
                                     Navigator.push(context, MaterialPageRoute(builder: (context)=> Billing(
                      widget.itemname_l,
                      widget.itemquantity_l,
                      widget.itemprice_l,
                      widget.itemdiscount_l,
                      widget.itemnettotal_l,
                      widget.itemdiscountvaluecost_l,
                      widget.itemtotalamount_l,
                      name_owner: "",
                      name_business: "",)
                      ));}
                                    );
                                  }, child: Text("delete")),
                              
                                ],
                              ),
                            ),
                          ],
                        ),
                            
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        ),
    );
    
   
 
}
}