import 'package:flutter/material.dart';
class Support extends StatefulWidget {
  @override
  _SupportState createState() => _SupportState();
}

class _SupportState extends State<Support> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
    //       actions: <Widget>[
    //   IconButton(
    //     icon: Icon(Icons.shopping_cart),
    //      onPressed: (){

    //      }
    //      ),
    // ],
    title: Text("Support", style: TextStyle(color: Colors.white),),


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
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 8.0,top: 10.0),
              child: Text("Help on other issue", style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            SizedBox(
              height: 50.0,
            ),
            Divider(
              height: 10.0,
            ),

            GestureDetector(
              onTap: (){
                //Add operation
                // Navigator.pushNamed(context, RouterName.callSupport);
                String phoneno='tel: 9935020063';
                // launch(phoneno);
              },
            child: Container(
              //decoration: ,

              height: 30,
              width: MediaQuery.of(context).size.width,
              
              child: Padding(
                padding: const EdgeInsets.only(left:8.0),
                child: (
                  Text("Information/issue with Digital Karobaar")
                ),
              ),

            )
            ),
            Divider(

            ),
            
            SizedBox(
              height: 10.0,
            ),
            GestureDetector(
              onTap: (){
                //Add operation
                String phoneno='tel: 9935020063';
              //   launch(phoneno);
                
              },
            child: Container(
              //decoration: ,

              height: 30,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: (
                  Text("Call for other issue")
                ),
              ),

            )
            ),
            
            Divider(),
            
          ],
        )
      ),
      
    );
  }
}