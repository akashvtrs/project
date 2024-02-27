// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, avoid_print, avoid_function_literals_in_foreach_calls, must_be_immutable




import 'package:final_project1/billing_page/additems.dart';
import 'package:final_project1/billing_page/listview_items.dart';
import 'package:final_project1/home_screen/apphomescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';





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
  final String name_Phone_No;
  final String name_Email;
  final String name_Address;
  final String name_Pincode;
  final String name_Business_Description;

 List add_list_name_customername=[];
 List add_list_no_phoneno=[];
 List add_list_items_noofitems=[];
 List add_list_amount_totalamount=[];
 List add_list_bal_balance=[];
 String customerid_cont;
  String phoneno_cont;



  Billing(
      this.itemname,
      this.itemquantity,
      this.itemprice,
      this.itemdiscount,
      this.itemnettotal,
      this.itemdiscountvaluecost,
      this.itemtotalamount,
      {super.key,required this.name_Phone_No,
      required this.name_Email,
      required this.name_Address,
      required this.name_Pincode,
      required this.name_Business_Description,
       required this.name_business, required this.name_owner,required this.add_list_name_customername,required this.add_list_no_phoneno,required this.add_list_items_noofitems,required this.add_list_amount_totalamount,required this.add_list_bal_balance,required this.customerid_cont,required this.phoneno_cont});

  @override
  State<Billing> createState() => _BillingState();
}

class _BillingState extends State<Billing> {
  TextEditingController customername_controller = TextEditingController();
  TextEditingController phoneno_controller = TextEditingController();
  TextEditingController paidamount_controller = TextEditingController();


  final customername = <String>[]; // Creates growable list.
  final customerphone = <String>[];
  final map = {};
  bool isCheckeds = false;
  bool bool_cont = true;
  bool bool_noitemsincart = true;
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
  double totalAmountForAllItems = 0.00;
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
    list_amount_totalamount.add(totalAmountForAllItems.toStringAsFixed(2));
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
name_Address: widget.name_Address,
name_Phone_No: widget.name_Phone_No,
name_Email: widget.name_Email,
name_Pincode: widget.name_Pincode,
name_Business_Description: widget.name_Business_Description,


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
      add_list_name_customername: list_name_customername,
      add_list_no_phoneno: list_no_phoneno,
      add_list_items_noofitems: list_items_noofitems,
      add_list_amount_totalamount: list_amount_totalamount,
      add_list_bal_balance: list_bal_balance,
      name_owner: widget.name_owner,
      name_Business: widget.name_business,
      name_Address: widget.name_Address,
      name_Phone_No: widget.name_Phone_No,
      name_Email: widget.name_Email,
      name_Pincode: widget.name_Pincode,
      name_Business_Description: widget.name_Business_Description,
      customerid_cont:customername_controller.text,
      phoneno_cont:phoneno_controller.text
      
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
       name_Address: widget.name_Address,
       name_Phone_No: widget.name_Phone_No,
       name_Email: widget.name_Email,
       name_Pincode: widget.name_Pincode,
       name_Business_Description: widget.name_Business_Description,

       
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
     bool_noitemsincart=true;
   }else{
     bool_noitemsincart=false;
   }     
   list_name_customername=widget.add_list_name_customername;
   list_no_phoneno=widget.add_list_no_phoneno;
   list_items_noofitems=widget.add_list_items_noofitems;
   list_amount_totalamount=widget.add_list_amount_totalamount;
   list_bal_balance=widget.add_list_bal_balance;
   customername_controller.text=widget.customerid_cont;
   phoneno_controller.text=widget.phoneno_cont;
    if (widget.itemname.isEmpty) {
                        bool_cont = !bool_cont;
                      }
   

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          
          child: Container(
            height: 1,
            color: Colors.blue.shade900,
          )
        ),
        backgroundColor: Colors.blue.shade100,
        foregroundColor: Colors.blue.shade900,
          automaticallyImplyLeading: false,
          leading:  Icon(Icons.account_circle_outlined),
        title: Center(child: Text("Customer Details")),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 8.0, left: 8.0),
          child: Column(
            children: [
              
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: TextField(
                    controller: customername_controller,
                    decoration: InputDecoration(
                      labelText: "Customer Name",
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
                      labelText: "Phone No",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom:8.0),
                child: ElevatedButton(style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  overlayColor: MaterialStateProperty.all(Colors.redAccent),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    )
                  )
                ),onPressed:additem_cl, child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add_circle),
                    Text("ADD ITEMS !!!"),
                   
                  ],
                )),
              ),

             
              InkWell(
               
                onTap: () {
                  setState(() {
                    if (widget.itemname.isNotEmpty) {
                      bool_cont = !bool_cont;
                      
                     
                    }
                   
                    
                    
                    
                  });
                },
                child: Container(
                  
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    
                    border: Border.all(color: Colors.blue.shade900),
                    
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    
                  ),
                  
                  
                  width: double.infinity,
                  child: Row(
                    children: [
                      Icon(Icons.arrow_drop_down,
                          color: Colors.blue.shade900),
                      Text("Billed Items",style: TextStyle(
                        color: Colors.blue.shade900
                      ),),
                    ],
                  ),
                ),
              ),Visibility(
                visible: bool_noitemsincart,
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
                visible: bool_cont,
                child: Column(
                  children: [
                    ListItems(
                          itemname_l:widget.itemname,
                    itemquantity_l:         widget.itemquantity,
                    itemprice_l:            widget.itemprice,
                    itemdiscount_l:         widget.itemdiscount,
                    itemnettotal_l:         widget.itemnettotal,
                    itemdiscountvaluecost_l:widget.itemdiscountvaluecost,
                    itemtotalamount_l:      widget.itemtotalamount,
                    add_list_name_customername: list_name_customername,
                    add_list_no_phoneno: list_no_phoneno,
                    add_list_items_noofitems: list_items_noofitems,
                    add_list_amount_totalamount: list_amount_totalamount,
                    add_list_bal_balance: list_bal_balance,
                    name_Business: widget.name_business,
                    name_owner: widget.name_owner,
                    name_Address: widget.name_Address,
                    name_Phone_No: widget.name_Phone_No,
                    name_Email: widget.name_Email,
                    name_Pincode: widget.name_Pincode,
                    name_Business_Description: widget.name_Business_Description,
                    

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
         Column(
           children: [
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Row(
                 children: [
                   Text("Total No.of Items:",style: TextStyle(fontWeight: FontWeight.bold),),
                   Icon(Icons.currency_rupee_rounded,color: Colors.black),
                   Text(widget.itemquantity.length.toString(),style: TextStyle(fontWeight: FontWeight.bold)),
                 ],
               ),
             ),Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("Total discount amount:",style: TextStyle(fontWeight: FontWeight.bold),),
                  Icon(Icons.currency_rupee_rounded,color: Colors.black),
                   Text(totalDiscountForAllItems.toString(),style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("Total net amount:",style: TextStyle(fontWeight: FontWeight.bold)),
                    Icon(Icons.currency_rupee_rounded,color: Colors.black,),
                     Text(totalNetTotalForAllItems.toString(),style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
           ],
         ),
         
             Divider(
                  color: Color.fromARGB(255, 229, 223, 214),
                )
              ,
              
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Total Amount:",style: TextStyle(fontWeight: FontWeight.bold,
                     
                    ),),
                    Icon(Icons.currency_rupee_rounded),
                  SizedBox(
                    
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                      
                        
                        Text(totalAmountForAllItems.toStringAsFixed(2),style: TextStyle(fontWeight: FontWeight.bold,
                          color: Colors.red,
                          fontSize: 20
                          
                        )),
                      ],
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Checkbox(
                          value: isCheckeds,
                          activeColor: Colors.green, 
                          onChanged: (bool? value) {                            
                              setState(() {
                                if (value == false) {
                                paidamount_controller.text="0.00";  
                                balance=totalAmountForAllItems.toStringAsFixed(2);
                                }
                                
                                if (value == true) {
                                  paidamount_controller.text=totalAmountForAllItems.toStringAsFixed(2);
                                 balance=((double.parse(totalAmountForAllItems.toStringAsFixed(2))-double.parse(paidamount_controller.text)).toStringAsFixed(2));
                                }
                               
                                isCheckeds = value!;
                              });                 
                          }),
                      Text("Received:",style: TextStyle(fontWeight: FontWeight.bold,
                      
                        
                      ),
                      ),
                       Icon(Icons.currency_rupee_rounded),
                    ],
                  ),
                  SizedBox(
                    width: 100,
                    
                    child: TextField(
                      onChanged: (value) => {
                        setState(() {
                          if (paidamount_controller.text.isNotEmpty) {
                            balance = ((double.parse(totalAmountForAllItems.toStringAsFixed(2)) - double.parse(paidamount_controller.text)).toStringAsFixed(2));
                          }
                          
                        })
                      },
                      
                      controller: paidamount_controller,
                      style: TextStyle(color:Colors.green
                      ,
                        fontSize: 20
                      ),
                      
                    ),
                  )
                ],
              ),
              
              
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.currency_rupee_rounded),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                    
                      
                      SizedBox(
                        width: 100,
                        child: Text(balance,style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        )),
                      ),
                    ],
                  ),
                ],
              ),
              
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor:Colors.black ,
        unselectedItemColor:Colors.black ,
        selectedIconTheme: IconThemeData(color: Colors.black),
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
  }
  
  void addnew_customer() {
    list_name_customername.add(customername_controller.text);
    list_no_phoneno.add(phoneno_controller.text);
    list_items_noofitems.add(widget.itemquantity.length.toString());
    list_amount_totalamount.add(totalAmountForAllItems.toStringAsFixed(2));
    list_bal_balance.add(balance);
    

   
    print(list_name_customername);
    print(list_no_phoneno);
    print(list_items_noofitems);
    print(list_amount_totalamount);
    print(list_bal_balance);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Billing([], [], [], [], [], [],[], name_business:widget.name_business  , name_owner: widget.name_owner,customerid_cont: customername_controller.text,phoneno_cont: phoneno_controller.text,
        
        add_list_name_customername: list_name_customername,
        add_list_no_phoneno: list_no_phoneno,
        add_list_items_noofitems: list_items_noofitems,
        add_list_amount_totalamount: list_amount_totalamount,
        add_list_bal_balance: list_bal_balance,
        name_Address: widget.name_Address,
        name_Business_Description: widget.name_Business_Description,
        name_Email: widget.name_Email,
        name_Phone_No: widget.name_Phone_No,
        name_Pincode: widget.name_Pincode,
      

        ),
      )
    );
    setState(() {
    widget.itemname.clear();
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
    totalAmountForAllItems = 0.00;
    totalDiscountForAllItems = 0.00;
    totalNetTotalForAllItems = 0.00;
    balance = "0.00";
    customername_controller.text="";
    phoneno_controller.text="";
    
    paidamount_controller.text="0.00";  

    });
  }
}

