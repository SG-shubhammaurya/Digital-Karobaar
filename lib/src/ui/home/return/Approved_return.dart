import 'package:flutter/material.dart';
class ApprovedReturn extends StatefulWidget {
  @override
  _ApprovedReturnState createState() => _ApprovedReturnState();
}

class _ApprovedReturnState extends State<ApprovedReturn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Approved Return"),
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
      body: Center(
        child: Container(child: Text("Sorry you don't have any Approved return now"),)
      ),
      
    );
  }
}