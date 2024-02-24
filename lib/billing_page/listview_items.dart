// ignore_for_file: non_constant_identifier_names, must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 400,
        width: 400,
        color: const Color.fromARGB(255, 196, 41, 41),
        child: ListView.builder(
            itemCount: widget.itemname_l.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Text(widget.itemname_l[index].toString()),
                  Text(widget.itemquantity_l[index].toString()),
                  Text(widget.itemprice_l[index].toString()),
                  Text(widget.itemdiscount_l[index].toString()),
                  Text(widget.itemnettotal_l[index].toString()),
                  Text(widget.itemdiscountvaluecost_l[index].toString()),
                  Text(widget.itemtotalamount_l[index].toString()),
        
                ],
              );
            }
          ),
      ),
    );
   
  }
}