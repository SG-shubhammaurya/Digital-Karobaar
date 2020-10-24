import 'package:flutter/material.dart';
class RejectedReturn extends StatefulWidget {
  @override
  _RejectedReturnState createState() => _RejectedReturnState();
}

class _RejectedReturnState extends State<RejectedReturn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Rejected Return"),
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
        child: Container(child: Text("Sorry you don't have any Rejected Return now"),)
      ),
    );
  }
}