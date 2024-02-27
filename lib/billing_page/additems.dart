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
List add_list_name_customername;
 List add_list_no_phoneno;
 List add_list_items_noofitems;
 List add_list_amount_totalamount;
 List add_list_bal_balance;
 String name_owner;
  String name_Business;
  String customerid_cont;
  String phoneno_cont;
  final String name_Phone_No;
  final String name_Email;
  final String name_Address;
  final String name_Pincode;
  final String name_Business_Description;

  AddItems(this.add_items_list_itemname,this.add_items_list_itemquantity,this.add_items_list_itemprice,this.add_items_list_itemdiscount,this.add_items_list_itemnettotal,this.add_items_list_itemdiscountvaluecost,this.add_items_list_itemtotalamount,{super.key, 
    required this.name_Phone_No, required this.name_Email, required this.name_Address, required this.name_Pincode, required this.name_Business_Description
  ,required this.name_Business, required this.name_owner,required this.add_list_name_customername,required this.add_list_no_phoneno,required this.add_list_items_noofitems,required this.add_list_amount_totalamount,required this.add_list_bal_balance,required this.customerid_cont,required this.phoneno_cont});

  @override
  State<AddItems> createState() => _AddItemsState();
}

class _AddItemsState extends State<AddItems> {
  TextEditingController itemname_controller = TextEditingController();
  TextEditingController quantity_controller = TextEditingController();
  TextEditingController price_controller = TextEditingController();
  TextEditingController discount_controllers = TextEditingController();

  
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
int _selectedIndex = 0; 
String errorstring='notnull';

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
      if (price_controller.text.isEmpty) {
          price_controller.text="0";
      }
      if (discount_controllers.text.isEmpty) {
          discount_controllers.text="0";
      }
      if (quantity_controller.text.isEmpty) {
          quantity_controller.text="0";
      }
      
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
void _onItemTapped(int index) {
  setState(() {
    _selectedIndex = index;
    if (index == 0) {
      Navigator.pop(context);
    }
    if (index==1) {
      setState(() {
        saves();
      });
      
    }
    if (index==2) {
      setState(() {
        addnew();
      });
      
      
    }
   
  });
}
  void saves() {
    setState(() {
      if (itemname_controller.text.isNotEmpty ) {
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
                  list_itemtotalamount,name_owner: widget.name_owner,name_business: widget.name_Business,  
                  name_Address: widget.name_Address,
                  name_Phone_No: widget.name_Phone_No,
                  name_Email: widget.name_Email,
                  name_Pincode: widget.name_Pincode,
                  name_Business_Description: widget.name_Business_Description,

                  add_list_amount_totalamount: widget.add_list_amount_totalamount,
                  
                  
                  add_list_name_customername: widget.add_list_name_customername,
                  
                  add_list_no_phoneno:widget.add_list_no_phoneno,
                 
                  add_list_items_noofitems: widget.add_list_items_noofitems,
                  
                  add_list_bal_balance: widget.add_list_bal_balance,
                  customerid_cont: widget.customerid_cont,
                  phoneno_cont: widget.phoneno_cont,
                  


                  

                  


                  )));
      }
      
     if (itemname_controller.text.isEmpty) {
        errorstring='';
     }

                  
    });
  }



  void addnew() {
    setState(() {
      if (itemname_controller.text.isNotEmpty ) {
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
add_list_name_customername: widget.add_list_name_customername,
        add_list_no_phoneno: widget.add_list_no_phoneno,
        add_list_items_noofitems: widget.add_list_items_noofitems,
        add_list_amount_totalamount:  widget.add_list_amount_totalamount,
        add_list_bal_balance:     widget.add_list_bal_balance,
        name_owner: widget.name_owner,
        name_Business: widget.name_Business,
        name_Address: widget.name_Address,
        name_Phone_No: widget.name_Phone_No,
        name_Email: widget.name_Email,
        name_Pincode: widget.name_Pincode,
        name_Business_Description: widget.name_Business_Description,
        
        customerid_cont: widget.customerid_cont,
        phoneno_cont: widget.phoneno_cont,

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
      if (itemname_controller.text.isEmpty) {
        errorstring='';
      }
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade100,
        foregroundColor: Colors.blue.shade900,
        leading: Icon(Icons.shopping_cart),
        title: Center(child: Text("Add Items to customer")),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
          
            
            children: [
            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
               
                  onChanged: (value) => {save_item_details(),setState(() {
                    errorstring = value;
                  })},
                  controller: itemname_controller,
                  maxLength: 16,
                  decoration: InputDecoration(
                    labelText: "Item Name",
                    hintText: "ex.,Chocolate Cake",
                    errorText:errorstring.isEmpty ? 'Item Name is required' : null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                  onChanged: (value) => {save_item_details()},
                  controller: quantity_controller,
                  
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "No. of items",
                    hintText: "Numbers only,ex.,0,1,2...9",
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(8.0)),
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                  onChanged: (value) => {save_item_details()},
                  controller: price_controller,
                   keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Cost",
                    hintText: "Numbers only,ex.,0,1,2...9",
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(8.0)),
                    ),
                  )),
            ),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Text("Net total:",style: TextStyle(
                    fontWeight: FontWeight.bold
                                 ),),
                                 Row(
                    children: [
                      Icon(Icons.currency_rupee_rounded,color: Colors.black,),
                      SizedBox(
                        width: 100,
                        child: Text(nettotal,style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                        ),),
                      ),
                    ],
                                 ),
                               ],
                             ),
                 ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                            controller: discount_controllers,
                             keyboardType: TextInputType.number,
                             
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
                                
                                labelText: "Discount",
                                hintText: "Discount in %,ex.,0,1,2....9",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(8.0)),
                                ))),
                ),
            
           
            
            
            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Discount:",style: TextStyle(
                    fontWeight: FontWeight.bold
              
                  )),
                 
                   Row(
                     children: [
                      Icon(Icons.currency_rupee_rounded,color: Colors.black,),
                       SizedBox(
                         width: 100,
                         child: Text(discountvaluecost,style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.green
                                           ),),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("TOTAL AMOUNT:",style: TextStyle(
                    fontWeight: FontWeight.bold
              
                  )),
                  Row(
                    children: [
                      Icon(Icons.currency_rupee_rounded,color: Colors.black,),
                      SizedBox(
                        width: 100,
                        child: Text(totalamount,style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.red
              
                        ),),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
        selectedIconTheme: IconThemeData(color: Colors.red),
        unselectedIconTheme: IconThemeData(color: Colors.black),
         unselectedFontSize: 14.0,
        backgroundColor: Colors.blue.shade100,
        currentIndex: _selectedIndex, //New
  onTap:_onItemTapped, 
    items: const <BottomNavigationBarItem>[
      
      
      BottomNavigationBarItem(
        icon: Icon(Icons.arrow_back),
        label: 'Back',
        
      ),
      BottomNavigationBarItem(

        icon: Icon(Icons.save),
        label: 'Save',
        
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.library_add),
        label: 'Save & New',
      ),
    ],
  ),
    );
  }}