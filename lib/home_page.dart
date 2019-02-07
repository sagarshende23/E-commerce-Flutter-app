import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

import 'package:hello_new/other_page.dart';
import 'package:hello_new/componets/products.dart';

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
      appBar: AppBar(
        title: Text("UNIQUE FLOWERS",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search,color: Colors.white), onPressed: () {

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
               onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) =>  OtherPage("First Page"))),
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
 

      body: Column(
        children: <Widget>[
          SizedBox(height: 10,),

          Text("Top Flower List",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            decorationColor: Colors.black,
            fontSize: 20,
            color: Colors.black,
          ),),
          SizedBox(height: 10.0,),
          
          

          Flexible(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
                itemCount: productItems.length,
                itemBuilder: (BuildContext context, int index){
                  return Card(
                    elevation: 3.0,                      
                       
                          child:Column(
                          children: <Widget>[
                            AspectRatio(
                              aspectRatio: 18/11,
                              child: Image.asset(productItems[index].itemImage,
                               fit: BoxFit.fitWidth,),
                              ),
                              
                             
                             Expanded(child: Padding(
                               padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                               child: Column(
                                 children: <Widget>[
                                  
                            Text(productItems[index].itemName,style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16.0 ),),
                            SizedBox(height: 8.0),
                            Text("₹${productItems[index].itemPrice}",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.green
                            ),),

                                 ],
                               ),
                             ),)
                            
                            



                          ],
                        ),


                       

                      
                  );
                },
                
              ),),
            ],
           ),
           
      );
  }
}

