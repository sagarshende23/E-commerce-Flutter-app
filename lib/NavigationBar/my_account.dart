import 'package:flutter/material.dart';

class MyAccounts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("My Account",style: TextStyle(color: Colors.white),),

        centerTitle: true,
      ),
      body: new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 150,
              width: 150,
              child: Image.asset('images/smile/smile.png'),
            ),
            SizedBox(height: 10.0,),
            new Text(
              
              "Coming Soon",
              style: new TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0,),
            Text(
              "Under Development",
              style: new TextStyle(fontSize: 14.0),
            ),
          ],
        ),
      ),
    );
  }
}