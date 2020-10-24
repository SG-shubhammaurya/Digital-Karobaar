import 'package:flutter/material.dart';
class PendingReturn extends StatefulWidget {
  @override
  _PendingReturnState createState() => _PendingReturnState();
}

class _PendingReturnState extends State<PendingReturn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pending Return"),
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
          child: Text("Sorry you don't have any prnding Return"),
        )
      ),
      
    );
  }
}