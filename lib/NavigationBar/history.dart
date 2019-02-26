import 'package:flutter/material.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("History",style: TextStyle(color: Colors.white),),

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
