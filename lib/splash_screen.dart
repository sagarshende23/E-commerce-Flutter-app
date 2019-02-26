import 'package:flutter/material.dart';
import 'package:hello_new/main.dart';
import 'package:splashscreen/splashscreen.dart';
class SplashScrren extends StatefulWidget {
  @override
  _SplashScrrenState createState() => new _SplashScrrenState();
}

class _SplashScrrenState extends State<SplashScrren> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 6,
      navigateAfterSeconds: new MyHomePage(),
      title: new Text('Welcome In Unique Flowers',
      style: new TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20.0
      ),),
      image: new Image.asset('assets/uniqueflower.jpg'),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
      onClick: ()=>print("Flutter Egypt"),
      loaderColor: Colors.red
    );
  }
}
