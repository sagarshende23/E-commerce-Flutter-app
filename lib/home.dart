import 'package:flutter/material.dart';

import 'package:hello_new/componets/products.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: productItems.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 3.0,
            child: Column(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 18 / 11,
                  child: Image.asset(
                    productItems[index].itemImage,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          productItems[index].itemName,
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 16.0),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          "₹${productItems[index].itemPrice}",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, color: Colors.green),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
