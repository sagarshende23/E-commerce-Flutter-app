import 'package:flutter/material.dart';
import 'dart:async';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 1));
          setState(() {
            return null;
          });
        },
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 110.0,
            ),
            Center(
              child: Icon(
                Icons.notifications,
                color: Colors.grey[400],
                size: 200.0,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Center(
              child: Text(
                'No Notification Yet!',
                style: TextStyle(fontSize: 20.0, color: Colors.grey[700]),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Center(
                          child: Text(
                'Come Back Later And Check Again',
                style: TextStyle(fontSize: 17.0, color: Colors.grey[700]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
