import 'package:flutter/material.dart';
class MemberUploadProduct extends StatefulWidget {
  @override
  _MemberUploadProductState createState() => _MemberUploadProductState();
}

class _MemberUploadProductState extends State<MemberUploadProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Member Upload Products"),
      ),
      body: ListView(
        children: [
          Center(
            child: Text("Here You Can upload a Products with your for better growth    Comming Soon")
          )
        ]
      ),
      
    );
  }
}