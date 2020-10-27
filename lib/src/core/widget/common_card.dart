
import 'package:flutter/material.dart';

class CommonCard extends StatelessWidget {
  final child;
  final elevation;
  CommonCard({this.child,this.elevation});
  @override
  Widget build(BuildContext context) {
    return Card(
        semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5,
          margin: EdgeInsets.all(10),
      child: child,
    );
  }
}