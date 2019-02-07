
import 'package:flutter/material.dart';
import 'package:hello_new/home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  final _usernameController = TextEditingController();
  
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 80.0,),
            Column(
              children: <Widget>[
                Image.asset('assets/diamond.png'),
                SizedBox(height: 16.0,),
                Text("Unique Flower"),
              ],
            ),
            SizedBox(height: 120.0,),
            InkWell(
              
                          child: TextField(
                            controller: _usernameController,
                decoration: InputDecoration(
                  
                  
                  
                  filled: true,
                  labelText: 'Username',
                  hintText: 'sagarshende',
                ),
              ),
            ),
            SizedBox(height: 12.0,),

            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                filled: true,
                labelText: 'Password',
              ),
              obscureText: true,
            ),

            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: Text('Cancel'),
                  onPressed: (){
                    _usernameController.clear();
                  },
                ),
                RaisedButton(
                  child: Text('Next'),
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => HomePage())
                    );
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}