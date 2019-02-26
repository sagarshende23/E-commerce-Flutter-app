import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:hello_new/NavigationBar/about_section.dart';
import 'package:hello_new/NavigationBar/history.dart';
import 'package:hello_new/NavigationBar/my_account.dart';
import 'package:hello_new/NavigationBar/my_order.dart';
import 'package:hello_new/NavigationBar/privacy_policy.dart';
import 'package:hello_new/adminScreen/admin_home.dart';
import 'package:hello_new/appBar/notification_page.dart';
import 'package:hello_new/item_detail.dart';
import 'package:hello_new/componets/products.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget imagecarousel = new Container(
      height: 200.0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Carousel(
          boxFit: BoxFit.cover,
          images: [
            AssetImage('images/genda.jpg'),
            AssetImage('images/ranjighanda.jpg'),
            AssetImage('images/mogralanger.jpg'),
            AssetImage('images/kudiyellow.jpg'),
          ],
          animationCurve: Curves.fastOutSlowIn,
          autoplay: true,
          animationDuration: Duration(milliseconds: 100),
          dotSize: 5,
          indicatorBgPadding: 5.0,
          dotBgColor: Colors.transparent,
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: GestureDetector(
          onLongPress: openAdmin,
          child: Text("UNIQUE FLOWERS",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: Colors.white)),
        ),
        backgroundColor: Colors.black,
        actions: <Widget>[
          //Search Button
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
          //Notification Button
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => NotificationPage())),
          ),
          //Shopping Cart Button
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        elevation: 10,
        child: ListView(
          children: <Widget>[
            //UserProfile Inkewell
            InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MyAccounts())),
              child: UserAccountsDrawerHeader(
                accountName:
                    Text("Sagar Shende", style: TextStyle(color: Colors.white)),
                accountEmail: Text("sagarshende631@gmail.com",
                    style: TextStyle(color: Colors.white)),
                currentAccountPicture: GestureDetector(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.people,
                      color: Colors.blue,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
              ),
            ),
            //HomePage
            InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => HomePage())),
              child: ListTile(
                title: Text("Home Page"),
                leading: Icon(
                  Icons.home,
                  color: Colors.green,
                ),
              ),
            ),
            //History
            InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => History())),
              child: ListTile(
                title: Text("History"),
                leading: Icon(
                  Icons.history,
                  color: Colors.black,
                ),
              ),
            ),
            //MyAccount
            InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MyAccounts())),
              child: ListTile(
                title: Text("My Account"),
                leading: Icon(Icons.person),
              ),
            ),
            //MyOrder
            InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MyOrder())),
              child: ListTile(
                title: Text("My Order"),
                leading: Icon(Icons.shopping_basket),
              ),
            ),
            Divider(),
            //About
            InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => AboutSection())),
              child: ListTile(
                title: Text("About"),
                leading: Icon(
                  Icons.help,
                  color: Colors.blue,
                ),
              ),
            ),
            //PrivacyPolicy
            InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => PrivacyPolicy())),
              child: ListTile(
                title: Text("Privacy Policy"),
                leading: Icon(
                  Icons.help_outline,
                  color: Colors.green,
                ),
              ),
            ),
          ],
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 1));
          setState(() {});
        },
        child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                    child: Container(
                      height: 200.0,
                      width: (MediaQuery.of(context).size.width / 2) - 20.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 2.0,
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 2.0)
                          ]),
                      child: Column(
                        children: <Widget>[
                          Stack(
                            children: <Widget>[
                              Container(
                                height: 125.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10.0),
                                        topRight: Radius.circular(10.0)),
                                    image: DecorationImage(
                                        image: AssetImage(
                                          productItems[index].itemImage,
                                        ),
                                        fit: BoxFit.cover)),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Align(
                                    alignment: Alignment.topRight,
                                    child: productItems[index].isFav
                                        ? Icon(Icons.favorite,
                                            color: Colors.red)
                                        : Icon(Icons.favorite_border,
                                            color: Colors.red)),
                              )
                            ],
                          ),
                          SizedBox(height: 15.0),
                          Text(
                            productItems[index].itemName,
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "?${productItems[index].itemPrice}",
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 14.0,
                                color: Colors.grey),
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
      ),
    );
  }

  openAdmin() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) => AdminHome()));
  }
}
