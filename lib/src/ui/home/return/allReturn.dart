import 'package:flutter/material.dart';
class AllReturn extends StatefulWidget {
  @override
  _AllReturnState createState() => _AllReturnState();
}

class _AllReturnState extends State<AllReturn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Returns"),
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
        child: Container(child: Text("Sorry you don't have any Return now"),)
      ),
      
    );
  }
}