import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

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
    return Padding(
      padding: EdgeInsets.only(top: 5.0,left: 5.0,right: 5.0),
      
          child: Container(
            width: double.infinity,
            height: 150.0,
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Container(
                  width: 100.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/redrose.jpg'),
                      fit: BoxFit.cover
                    )
                  ),
                ),
                SizedBox(width: 4.0,),

                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text('Red Roses',
                        style: TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold
                        ),),

                SizedBox(width: 85.0,),
                      ],
                    ),
                    SizedBox(height: 5.0,),
                    Container(
                      width: 200.0,
                      child: Text(
                         "A rose is a woody perennial flowering plant of the genus Rosa, in the family Rosaceae, or the flower it bears.",
                        textAlign: TextAlign.left,
                        style: TextStyle( fontSize: 12.0,color: Colors.grey,),),
                    ),
                    SizedBox(height: 20.0,),

                  
                  Row(
                   children:<Widget>[
                    SizedBox(width: 10.0,),
                      Container(
                      height: 36.0,
                      width: 50.0,
                      color: Color(getColorHexFromStr('#F9C335')),
                      child: Center(
                        child: Text(
                          '\₹100',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),

                      RaisedButton(
                        onPressed: () {},
                        color: Color(getColorHexFromStr('#FEDD59')),
                        child: Text(
                          "Add to Cart",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        ),
                      )
                   ],
                  )
                  ],
                ),
              ],
         ),
      ),

    );
  }
}