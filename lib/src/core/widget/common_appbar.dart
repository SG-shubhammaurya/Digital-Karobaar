import 'package:flutter/material.dart';
class CommonAppBar{

  static commonAppBar(String title){
    return AppBar(
        centerTitle: true,
        title: Text(title,
            style: TextStyle(color: Colors.white, fontSize: 18)),
        automaticallyImplyLeading: false,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(55))),
        //  bottom: _appBarBottom()
      );
  }
 
}

