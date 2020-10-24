
import 'package:flutter/material.dart';

class CommonCard extends StatelessWidget {
  final child;
  CommonCard({this.child});
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