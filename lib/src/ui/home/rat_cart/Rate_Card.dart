import 'package:flutter/material.dart';
class RateCard extends StatefulWidget {
  @override
  _RateCardState createState() => _RateCardState();

  
}

class _RateCardState extends State<RateCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rate Card",),
         leading: Builder(
       builder: (BuildContext context) {
         return IconButton(
           icon: const Icon(Icons.arrow_back_ios,color: Colors.white),
           onPressed: () { 
            Navigator.of(context).pop();
              },
           tooltip: "Back",
         );
       },
     
        ),
      ),
      body: Container(
        child: Column(
          children:<Widget>[
            Container(
              height: 80,
             color: Colors.black12,
              width: MediaQuery.of(context).size.width,
              child: Center(child: Text("Sorry we will available soon")),
            ),
            SizedBox(
              height: 10
            ),
            Container(
              height: 90,
           color: Colors.black12,



              width: MediaQuery.of(context).size.width,
              child: Center(child: Text("Sorry we will available soon")),
            )
          ]
        ),
        //child: Text("Comming Soon"),
      ),
      
    );
  }
}