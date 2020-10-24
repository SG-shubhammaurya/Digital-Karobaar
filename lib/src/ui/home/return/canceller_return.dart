import 'package:flutter/material.dart';
class CancelledReturn extends StatefulWidget {
  @override
  _CancelledReturnState createState() => _CancelledReturnState();
}

class _CancelledReturnState extends State<CancelledReturn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cancelled Return"),
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
        child: Container(
          child: Text("Sorry you don't have any cancelled return"),
        )
      ),
      
    );
  }
}