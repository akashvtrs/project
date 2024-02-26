// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:final_project1/home_screen/apphomescreen.dart';
import 'package:flutter/material.dart';


class Details extends StatefulWidget {
  const Details({super.key});

 

  @override
  State<Details> createState() => _DetailsState();
}


class _DetailsState extends State<Details> {
  
  String Business_Name = "";
  String Owner_Name = "";
  String Phone_No = "";
  String Email = "";
  String Address = "";
  String Pincode = "";
  String Business_Description = "";
  TextEditingController business_name_controller = TextEditingController();
  TextEditingController owner_name_controller = TextEditingController();
  TextEditingController phone_no_controller = TextEditingController();
  TextEditingController email_controller = TextEditingController();
  TextEditingController address_controller = TextEditingController();
  TextEditingController pincode_controller = TextEditingController();
  TextEditingController business_description_controller =
      TextEditingController();
      int _selectedIndex = 0; 
      void _onItemTapped(int index) {
  setState(() {
    _selectedIndex = index;
    if (index == 1) {
      setState(() {
        clear();
      });
    }
    if (index==0) {
      setState(() {
        save();
      });
      
    }
    if (index==2) {
      setState(() {
        save_pass();
      });
      
      
    }
   
  });
}
void save_pass() {
                      if (
                        business_name_controller.text.isNotEmpty && owner_name_controller.text.isNotEmpty 
            && phone_no_controller.text.isNotEmpty && email_controller.text.isNotEmpty && address_controller.text.isNotEmpty && pincode_controller.text.isNotEmpty
            && business_description_controller.text.isNotEmpty
                      ) {
                         Business_Name = business_name_controller.text;
            Owner_Name = owner_name_controller.text;
            Phone_No = phone_no_controller.text;
            Email = email_controller.text;
            Address = address_controller.text;
            Pincode = pincode_controller.text;
            Business_Description = business_description_controller.text;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Identities(name_owner:Owner_Name, name_Business: Business_Name,
      name_customername:[],
      no_phoneno:[],
      items_noofitems:[],
      amount_totalamount:[],
      bal_balance:[]),
                          ));
                      }
                     
                    }

  void save() {
    setState(() {
      if (business_name_controller.text.isNotEmpty && owner_name_controller.text.isNotEmpty 
      && phone_no_controller.text.isNotEmpty && email_controller.text.isNotEmpty && address_controller.text.isNotEmpty && pincode_controller.text.isNotEmpty
      && business_description_controller.text.isNotEmpty
      ) {
        Business_Name = business_name_controller.text;
      Owner_Name = owner_name_controller.text;
      Phone_No = phone_no_controller.text;
      Email = email_controller.text;
      Address = address_controller.text;
      Pincode = pincode_controller.text;
      Business_Description = business_description_controller.text;
      }
      
    });
  }

  void clear() {
    setState(() {
      Business_Name = "";
      Owner_Name = "";
      Phone_No = "";
      Email = "";
      Address = "";
      Pincode = "";
      Business_Description = "";
business_name_controller.text="";
owner_name_controller.text="";
phone_no_controller.text="";
email_controller.text="";
address_controller.text="";
pincode_controller.text="";
business_description_controller.text="";


    });
  }
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.blue.shade100,
        title: Center(child: Text("BUSINESS PROFILE", style: TextStyle(fontSize: 20)),),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            
            TextField(
              controller: business_name_controller,
              decoration: InputDecoration(
                  label: Text("Business Name"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)))),
            ),
            TextField(
              controller: owner_name_controller,
              decoration: InputDecoration(
                  label: Text("Owner Name"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)))),
            ),
            TextField(
              controller: phone_no_controller,
              decoration: InputDecoration(
                  label: Text("Phone No"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)))),
            ),
            TextField(
              controller: email_controller,
              decoration: InputDecoration(
                  label: Text("Email"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)))),
            ),
            TextField(
              controller: address_controller,
              decoration: InputDecoration(
                  label: Text("Address"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)))),
            ),
            TextField(
              controller: pincode_controller,
              decoration: InputDecoration(
                  label: Text("Pincode"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)))),
            ),
            TextField(
              controller: business_description_controller,
              decoration: InputDecoration(
                  label: Text("Business Description"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)))),
            ),
           
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, //New
  onTap:_onItemTapped, 
    items: const <BottomNavigationBarItem>[
      
      
      BottomNavigationBarItem(
        icon: Icon(Icons.save),
        label: 'Save',
        
      ),
      BottomNavigationBarItem(

        icon: Icon(Icons.delete),
        label: 'clear',
        
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.send),
        label: 'Next',
      ),
    ],
  ),
    );
  }
}
