import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {

  var productList = [

   {
        "name" : "Blazer",
        "picture" : "images/products/blazer1.jpeg",
        "old_price": 120 ,
        "price" : 85, 
   },

   {
        "name" : "Blazer",
        "picture" : "images/products/dress1.jpeg",
        "old_price": 120 ,
        "price" : 85, 
   },
  ];



  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}
