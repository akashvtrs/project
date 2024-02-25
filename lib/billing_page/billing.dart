// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, avoid_print, avoid_function_literals_in_foreach_calls


import 'package:final_project1/billing_page/additems.dart';
import 'package:final_project1/billing_page/listview_items.dart';
import 'package:final_project1/home_screen/apphomescreen.dart';
import 'package:flutter/material.dart';





class Billing extends StatefulWidget {

  final List itemprice;
  final List itemquantity;
  final List itemdiscount;
  final List itemname;
  final List itemdiscountvaluecost;
  final List itemnettotal;
  final List itemtotalamount;
  final String name_owner;
  final String name_business;


  const Billing(
      this.itemname,
      this.itemquantity,
      this.itemprice,
      this.itemdiscount,
      this.itemnettotal,
      this.itemdiscountvaluecost,
      this.itemtotalamount,
      {super.key, required this.name_business, required this.name_owner});

  @override
  State<Billing> createState() => _BillingState();
}

class _BillingState extends State<Billing> {
  TextEditingController customername_controller = TextEditingController();
  TextEditingController phoneno_controller = TextEditingController();
  TextEditingController paidamount_controller = TextEditingController();
  TextEditingController description_controller = TextEditingController();

  final customername = <String>[]; // Creates growable list.
  final customerphone = <String>[];
  final map = {};
  bool isCheckeds = false;
  bool bool_cont = true;
  bool bool_noitemsincart = false;
  Color? discountcontainercolor=Colors.blueAccent;
int _selectedIndex = 0; 
 
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
   List list_name_customername=[];
 List list_no_phoneno=[];
 List list_items_noofitems=[];
 List list_amount_totalamount=[];
 List list_bal_balance=[];
  String balance = "0.00";
   void save_customer() {
    list_name_customername.add(customername_controller.text);
    list_no_phoneno.add(phoneno_controller.text);
    list_items_noofitems.add(widget.itemquantity.length.toString());
    list_amount_totalamount.add(totalAmountForAllItems.toString());
    list_bal_balance.add(balance);
    print(list_name_customername);
    print(list_no_phoneno);
    print(list_items_noofitems);
    print(list_amount_totalamount);
    print(list_bal_balance);
    
    Navigator.push(
       context,MaterialPageRoute(builder:(context) => Identities(name_owner: widget.name_owner, name_Business: widget.name_business,
        name_customername:list_name_customername,
no_phoneno:list_no_phoneno,

items_noofitems:list_items_noofitems,
amount_totalamount:list_amount_totalamount,
bal_balance:list_bal_balance
       )));
    
  }
  additem_cl() {
    customername.add(customername_controller.text);
    customerphone.add(phoneno_controller.text);
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
void _onItemTapped(int index) {
  setState(() {
    _selectedIndex = index;
    if (index == 0) {
       Navigator.push(
       context,MaterialPageRoute(builder:(context) => Identities(name_owner: widget.name_owner, name_Business: widget.name_business,
        name_customername:list_name_customername,
no_phoneno:list_no_phoneno,

items_noofitems:list_items_noofitems,
amount_totalamount:list_amount_totalamount,
bal_balance:list_bal_balance
       )));
    }
    if (index==1) {
      setState(() {
        save_customer();
      });
      
    }
    if (index==2) {
      setState(() {
        addnew_customer();
      });
      
      
    }
   
  });
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
                    controller: phoneno_controller,
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
                    controller: description_controller,
                    maxLines: null,

                    
                      decoration: InputDecoration( 
                        
                        contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                          labelText: "Description or Address",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          ))),
                ),
              ),
             
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, //New
  onTap:_onItemTapped, 
    items: const <BottomNavigationBarItem>[
      
      
      BottomNavigationBarItem(
        icon: Icon(Icons.keyboard_arrow_left),
        label: 'Back',
        
      ),
      BottomNavigationBarItem(

        icon: Icon(Icons.save),
        label: 'Save',
        
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.add),
        label: 'Save & New',
      ),
    ],
  ),
    );
  }
  
  void addnew_customer() {
    list_name_customername.add(customername_controller.text);
    list_no_phoneno.add(phoneno_controller.text);
    list_items_noofitems.add(widget.itemquantity.length.toString());
    list_amount_totalamount.add(totalAmountForAllItems.toString());
    list_bal_balance.add(balance);
    

   
    print(list_name_customername);
    print(list_no_phoneno);
    print(list_items_noofitems);
    print(list_amount_totalamount);
    print(list_bal_balance);
    setState(() {
    widget.itemname.clear();
    print(widget.itemname);
    widget.itemquantity.clear();
    print(widget.itemquantity);
    widget.itemprice.clear();
    print(widget.itemprice);
    widget.itemdiscount.clear();
    print(widget.itemdiscount);
    widget.itemnettotal.clear();
    print(widget.itemnettotal);
    widget.itemdiscountvaluecost.clear();
    print(widget.itemdiscountvaluecost);
    widget.itemtotalamount.clear();
    print(widget.itemtotalamount);
    totalAmountForAllItems = 0.0;
    totalDiscountForAllItems = 0.0;
    totalNetTotalForAllItems = 0.0;
    balance = "0.00";
    customername_controller.text="";
    phoneno_controller.text="";
    description_controller.text="";
    paidamount_controller.text="0.00";


    

      
  
    });
  }
  
  

//    double sum = 0.0;
//  widget.itemdiscountvaluecost.forEach((item) {
//    sum += double.parse(item);
//  });
//  //Text(sum.toStringAsFixed(2));
//  print('Total sum:${sum.toStringAsFixed(2)}');
//  }
 
}

