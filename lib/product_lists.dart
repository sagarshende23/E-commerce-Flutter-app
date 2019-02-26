import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hello_new/componets/products.dart';
import 'package:hello_new/item_detail.dart';

class ProductList extends StatefulWidget {
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 1));
          setState(() {});
        },
        child: Column(
          children: <Widget>[
            Flexible(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: productItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ItemDetail(
                                itemImage: productItems[index].itemImage,
                                itemName: productItems[index].itemName,
                                itemPrice: productItems[index].itemPrice,
                              )));
                    },
                    child: Card(
                      elevation: 30.0,
                      child: Column(
                        children: <Widget>[
                          Stack(
                            children: <Widget>[
                              AspectRatio(
                                aspectRatio: 18 / 11,
                                child: Image.asset(
                                  productItems[index].itemImage,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.favorite_border,
                                    color: Colors.blue,
                                  ),
                                  onPressed: () {},
                                ),
                              )
                            ],
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  16.0, 12.0, 16.0, 8.0),
                              child: Column(
                                children: <Widget>[
                                  //Product Name
                                  Text(
                                    productItems[index].itemName,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16.0),
                                  ),
                                  //Space Between
                                  SizedBox(height: 8.0),
                                  //Product Price
                                  Text(
                                    "₹${productItems[index].itemPrice}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.green),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
  }
}