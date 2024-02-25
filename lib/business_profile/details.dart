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

  void save() {
    setState(() {
      Business_Name = business_name_controller.text;
      Owner_Name = owner_name_controller.text;
      Phone_No = phone_no_controller.text;
      Email = email_controller.text;
      Address = address_controller.text;
      Pincode = pincode_controller.text;
      Business_Description = business_description_controller.text;
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
    });
  }
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child: Column(
            children: [
              Text("Profile Section"),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.blue),
                      onPressed: save,
                      child: Text("save")),
                  TextButton(
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.blue),
                      onPressed: clear,
                      child: Text("clear")),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Identities(Owner_Name,Business_Name),
                            ));
                      },
                      icon: Icon(Icons.send)),
                ],
              ),
              Text(Business_Name),
              Text(Owner_Name),
              Text(Phone_No),
              Text(Email),
              Text(Address),
              Text(Pincode),
              Text(Business_Description),
              Text("-----------------------------------------"),
              Text(Business_Name),
              Text(Owner_Name),
              Text(Phone_No),
              Text(Email),
              Text(Address),
              Text(Pincode),
              Text(Business_Description),
            ],
          ),
        ),
      ),
    );
  }
}
