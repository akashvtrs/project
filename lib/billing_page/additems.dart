// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, non_constant_identifier_names, avoid_print, must_be_immutable


import 'package:final_project1/billing_page/billing.dart';
import 'package:flutter/material.dart';



class AddItems extends StatefulWidget {
List add_items_list_itemname = [];
List add_items_list_itemquantity = [];
List add_items_list_itemprice = [];
List add_items_list_itemdiscount = [];
List add_items_list_itemnettotal = [];
List add_items_list_itemdiscountvaluecost = [];
List add_items_list_itemtotalamount = [];
   AddItems(this.add_items_list_itemname,this.add_items_list_itemquantity,this.add_items_list_itemprice,this.add_items_list_itemdiscount,this.add_items_list_itemnettotal,this.add_items_list_itemdiscountvaluecost,this.add_items_list_itemtotalamount,{super.key});

  @override
  State<AddItems> createState() => _AddItemsState();
}

class _AddItemsState extends State<AddItems> {
  TextEditingController itemname_controller = TextEditingController();
  TextEditingController quantity_controller = TextEditingController();
  TextEditingController price_controller = TextEditingController();
  TextEditingController discount_controllers = TextEditingController();

  bool isVisible = true;
  String nettotal = "0.00";

  String discountvaluecost = "0.00";
  String totalamount = "0.00";
  List list_itemname = [];
List list_itemquantity = [];
List list_itemprice = [];
List list_itemdiscount = [];
List list_itemnettotal = [];
List list_itemdiscountvaluecost = [];
List list_itemtotalamount = [];

  @override
  void initState() {
    super.initState();
    save_item_details();
    list_itemname=widget.add_items_list_itemname;
    list_itemquantity=widget.add_items_list_itemquantity;
    list_itemprice=widget.add_items_list_itemprice;
    list_itemdiscount=widget.add_items_list_itemdiscount;
    list_itemnettotal=widget.add_items_list_itemnettotal;
    list_itemdiscountvaluecost=widget.add_items_list_itemdiscountvaluecost;
    list_itemtotalamount=widget.add_items_list_itemtotalamount;
    
    
    
    
  }

  void save_item_details() {
    setState(() {
      if (itemname_controller.text.isNotEmpty &&
          quantity_controller.text.isNotEmpty &&
          price_controller.text.isNotEmpty) {
        // print(items);
        // print(quantity);
        // print(price);
        int quantityvalue = 0;
        int pricevalue = 0;

        quantityvalue = int.parse(quantity_controller.text);
        pricevalue = int.parse(price_controller.text);
        nettotal = "${quantityvalue * pricevalue}.00";
        if (discount_controllers.text.isEmpty) {
          totalamount=nettotal;
        }
        
      } else {
        nettotal = "0.00";
        
      }
      if (discount_controllers.text.isNotEmpty) {
        
        discountvaluecost = ((int.parse(quantity_controller.text)*(int.parse(price_controller.text)))*(int.parse(discount_controllers.text)/100)).toStringAsFixed(2);
         totalamount = (double.parse(
                                                        nettotal) -
                                                    double.parse(discountvaluecost))
                                                .toStringAsFixed(2);
      }
      
    });
  }

  void saves() {
    setState(() {
      isVisible = true;
      list_itemname.add(itemname_controller.text);
    list_itemquantity.add(quantity_controller.text);
    list_itemprice.add(price_controller.text);
    list_itemdiscount.add(discount_controllers.text);
    list_itemnettotal.add(nettotal);
    list_itemdiscountvaluecost.add(discountvaluecost);
    list_itemtotalamount.add(totalamount);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Billing(
                  list_itemname,
                  list_itemquantity,
                  list_itemprice,
                  list_itemdiscount,
                  list_itemnettotal,
                  list_itemdiscountvaluecost,
                  list_itemtotalamount)));
                  
    });
  }

 // void clear() {
 //
 //  
 //     Navigator.push(
 //       context,MaterialPageRoute(builder: (context) => ListItems(
//
 //         itemname_l:list_itemname,
 //         itemquantity_l:              list_itemquantity,
 //         itemprice_l:                 list_itemprice,
 //         itemdiscount_l:              list_itemdiscount,
 //         itemnettotal_l:              list_itemnettotal,
 //         itemdiscountvaluecost_l:     list_itemdiscountvaluecost,
 //         itemtotalamount_l:           list_itemtotalamount,
 //       )),
 //     );
 // 
 // }

  void addnew() {
    list_itemname.add(itemname_controller.text);
    list_itemquantity.add(quantity_controller.text);
    list_itemprice.add(price_controller.text);
    list_itemdiscount.add(discount_controllers.text);
    list_itemnettotal.add(nettotal);
    list_itemdiscountvaluecost.add(discountvaluecost);
    list_itemtotalamount.add(totalamount);
    print(list_itemname);
    print(list_itemquantity);
    print(list_itemprice);
    print(list_itemdiscount);
    print(list_itemnettotal);
    print(list_itemdiscountvaluecost);
    print(list_itemtotalamount);
    
    AddItems(
      list_itemname,
list_itemquantity,
list_itemprice,
list_itemdiscount,
list_itemnettotal,
list_itemdiscountvaluecost,
list_itemtotalamount,
    );
    print("called");
    setState(() {
      itemname_controller.text = "";
      quantity_controller.text = "";
      price_controller.text = "";
      discount_controllers.text = "";
      nettotal = "0.00";
      discountvaluecost = "0.00";
      totalamount = "0.00";

    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(children: [
              Text("ADD ITEMS TO SALE"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                    onChanged: (value) => {save_item_details()},
                    controller: itemname_controller,
                    decoration: InputDecoration(
                      labelText: "ITEM NAME",
                      hintText: "e.g.Chocolate Cake",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 150,
                      child: TextField(
                          onChanged: (value) => {save_item_details()},
                          controller: quantity_controller,
                          decoration: InputDecoration(
                            labelText: "Quantity",
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                            ),
                          )),
                    ),
                    SizedBox(
                      width: 150,
                      child: TextField(
                          onChanged: (value) => {save_item_details()},
                          controller: price_controller,
                          decoration: InputDecoration(
                            labelText: "Rate(Price/Unit)",
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: isVisible,
                child: Divider(
                  color: Colors.black,
                ),
              ),
              Visibility(
                visible: isVisible,
                child: Container(
                    width: 400,
                    color: Color.fromARGB(153, 248, 186, 186),
                    height: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Totals & discount",
                        ),
                        Divider(
                          color: Color.fromARGB(255, 229, 223, 214),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Net total"),
                            Row(
                              children: [
                                Icon(Icons.currency_rupee, size: 15),
                                Text(nettotal),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Discount"),
                            Row(
                              children: [
                                SizedBox(
                                  width: 140,
                                  height: 30,
                                  child: TextField(
                                      controller: discount_controllers,
                                      onChanged: (value) {
                                        
                                        setState(() {
                                          
                                         
                                          if (discount_controllers
                                              .text.isNotEmpty) {
                                                
                                            int discountvalue = int.parse(
                                                discount_controllers.text);
                                            discountvaluecost =
                                                ((discountvalue / 100) *
                                                        double.parse(nettotal))
                                                    .toStringAsFixed(2);
                                            
                                            totalamount = (double.parse(
                                                        nettotal) -
                                                    double.parse(discountvaluecost))
                                                .toStringAsFixed(2);
                                            
                                            
                                            print(totalamount);
                                            print(discountvaluecost);
                                          } else {
                                            
                                            discountvaluecost = "0.00";
                                          }
                                        });
                                      },
                                      decoration: InputDecoration(
                                          suffixIcon: Container(
                                            decoration: BoxDecoration(
                                                border: Border(
                                              left:
                                                  BorderSide(color: Colors.red),
                                            )),
                                            child: Icon(
                                              Icons.percent,
                                              size: 15,
                                            ),
                                          ),
                                          labelText: "Discount",
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8.0)),
                                          ))),
                                ),
                                Text(discountvaluecost),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("TOTAL AMOUNT"),
                            Row(
                              children: [
                                Icon(Icons.currency_rupee, size: 15),
                                Text(totalamount),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 231, 234, 237),
                              ),
                              onPressed: saves,
                              child: Text("Save"),
                            ),
                          // ElevatedButton(
                          //   style: ElevatedButton.styleFrom(
                          //     backgroundColor:
                          //         const Color.fromARGB(255, 227, 233, 238),
                          //   ),
                          //   onPressed: clear,
                          //   child: Text("clear"),
                          // ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 208, 222, 233),
                              ),
                              onPressed: addnew,
                              child: Text("Save & Add  New Item"),
                            )
                          ],
                        ),
                      ],
                    )),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
