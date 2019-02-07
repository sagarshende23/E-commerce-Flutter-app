import 'package:flutter/material.dart';
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

    
//Search Results

  @override
  List<Widget> buildActions(BuildContext context) {

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