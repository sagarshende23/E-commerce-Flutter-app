import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:hello_new/product_page.dart';
import 'package:hello_new/serach_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int getColorHexFromStr(String colorStr) {
    colorStr = "FF" + colorStr;
    colorStr = colorStr.replaceAll("#", "");
    int val = 0;
    int len = colorStr.length;
    for (int i = 0; i < len; i++) {
      int hexDigit = colorStr.codeUnitAt(i);
      if (hexDigit >= 48 && hexDigit <= 57) {
        val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 65 && hexDigit <= 70) {
        // A..F
        val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 97 && hexDigit <= 102) {
        // a..f
        val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
      } else {
        throw new FormatException("An error occurred when converting a color");
      }
    }
    return val;
  }





  @override

  Widget build(BuildContext context) {

    Widget imagecarousel = new Container(
      height: 200.0,
       child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/c1.jpg'),
           AssetImage('images/m1.jpeg'),
             AssetImage('images/w4.jpeg'),
              AssetImage('images/w3.jpeg'),
        ],
        animationCurve: Curves.fastOutSlowIn,
        autoplay: true,
        animationDuration: Duration(milliseconds: 100),
        dotSize: 5,
        indicatorBgPadding: 5.0,
        dotBgColor: Colors.transparent,

      ),

    );




    return Scaffold(
      appBar: AppBar(
        
        title: Text("UNIQUE FLOWERS",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),),
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search,color: Colors.white), onPressed: () {
            showSearch(context: context, delegate: DataSearch());
          }, ),
          IconButton(icon: Icon(Icons.notifications,color: Colors.white), onPressed: () {}, ),
          IconButton(icon: Icon(Icons.shopping_cart,color: Colors.white), onPressed: () {}, ),
        ],
      ),

      

      drawer: Drawer(
        elevation: 10,
        child: ListView(
           children: <Widget>[
             UserAccountsDrawerHeader(
               
               accountName: Text("Sagar Shende"),
               accountEmail: Text("sagarshende631@gmail.com"),
               currentAccountPicture: GestureDetector(
                 child: CircleAvatar(
                   backgroundColor: Colors.white,
                   child: Icon(Icons.people, color: Colors.black,),
                 ),
               ),

               decoration: BoxDecoration(
                 color: Colors.black
               ),
             ),
             InkWell(
               onTap: () {},
               child: ListTile(
                 title: Text("Home Page"),
                 leading: Icon(Icons.home,color: Colors.green,),
               ),
             ),

             InkWell(
               onTap: () {},
               child: ListTile(
                 title: Text("History"),
                 leading: Icon(Icons.history, color: Colors.black,),
                 
               ),
             ),

             InkWell(
               onTap: () {},
               child: ListTile(
                 title: Text("My Account"),
                 leading: Icon(Icons.person),
               ),
             ),

             InkWell(
               onTap: () {},
               child: ListTile(
                 title: Text("My Order"),
                 leading: Icon(Icons.shopping_basket),
               ),
             ),
             
             Divider(),

             InkWell(
               onTap: () {},
               child: ListTile(
                 title: Text("About"),
                 leading: Icon(Icons.help, color: Colors.blue,),),
             ),

              InkWell(
               onTap: () {},
               child: ListTile(
                 title: Text("Privacy Policy"),
                 leading: Icon(Icons.help_outline,color: Colors.green,),
               ),
             ),


           ],
        ),
      ),


      body: 
      ListView(
        

        children: <Widget>[
          
          imagecarousel,
          ProductPage(),

        ],

      )
    );
  }
}

class DataSearch extends SearchDelegate<String>{

  final flower = [
    "RedRose",
    "YellowRose",
     "WHiteRose",
     "Lily",
     "Gulab",
     "GendaPhool",
     "RedRose",
     "RedRose",

  ];

  final recentFlower = [
     "RedRose",
    "YellowRose",
     "WHiteRose",
     "Lily",

  ];

    


  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        }
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      onPressed: (){
        close(context, null);
      },
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Container(
      height: 100.0,
      width: 100.0,
          child: Card(
        color: Colors.red,
        shape: StadiumBorder(),
        child: Center(
          child: Text(query),
        ),
      ),
    );
    
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
     final suggestionList = query.isEmpty 
     ? recentFlower 
     : flower.where((p) => p.startsWith(query)).toList();


     return ListView.builder(
       itemBuilder: (context, index) => ListTile(
         onTap: (){
           showResults(context);
         },
         leading: Icon(Icons.location_city),
         title: RichText(text: TextSpan(
           text: suggestionList[index].substring(0,query.length),
           style: TextStyle(
             color: Colors.black,
             fontWeight: FontWeight.bold
           ),
           children: [TextSpan(
             text: suggestionList[index].substring(query.length),
             style: TextStyle(color: Colors.grey)
           ),
           ]),
       ),
       ), 
       itemCount: suggestionList.length,
     );
  }


} 