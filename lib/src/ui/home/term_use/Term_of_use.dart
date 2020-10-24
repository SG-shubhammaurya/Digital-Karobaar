import 'package:flutter/material.dart';
class TermOfUse extends StatefulWidget {
  @override
  _TermOfUseState createState() => _TermOfUseState();
}

class _TermOfUseState extends State<TermOfUse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Term of Use",style: TextStyle(color: Colors.white),),
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
          children: <Widget> [

            SizedBox(
              height: 40.0
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Container(
                color: Colors.black12,
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20.0,
                        ),
                        CircleAvatar(
                          child: Text("1",style:  TextStyle(color: Colors.white),),
                          backgroundColor: Colors.blue,
                          radius: 15,

                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20.0
                    ),

                    Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20.0
                        ),
                        Text("Term and Condition", style: TextStyle(fontWeight: FontWeight.bold),),
                        SizedBox(
                          height: 20.0
                        ),
                        Text("Tap to know more")
                      ],
                    ),
                    SizedBox(
                      width: 80.0
                    ),
                    Text(">")
                  ],
                )
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Container(
                 color: Colors.black12,
                height: 150,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20.0,
                        ),
                        CircleAvatar(
                          child: Text("2", style: TextStyle(color: Colors.white),),
                          backgroundColor: Colors.blue,
                          radius: 15,

                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20.0
                    ),

                    Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20.0
                        ),
                        Text("Term and Condition for", style: TextStyle(fontWeight: FontWeight.bold),),
                        Text("Logistics Services and ", style: TextStyle(fontWeight: FontWeight.bold),),
                        Padding(
                          padding: const EdgeInsets.only(right:38.0),
                          child: Text("Payment Services", style: TextStyle(fontWeight: FontWeight.bold),),
                        ),

                        SizedBox(
                          height: 20.0
                        ),
                        Text("Tap to know more")
                      ],
                    ),
                    SizedBox(
                      width: 50.0
                    ),
                    Text(">")
                  ],
                )
              ),
            )
          ]
        ),
      
      ),
      
    );
  }
}