import 'package:digitalkarobaar/src/res/app_colors.dart';
import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(

  primaryColor: AppColors.primaryColor,
  cardTheme: CardTheme(color: Colors.white),
  brightness: Brightness.light,
  accentColor: Colors.redAccent,
  cardColor: Colors.white,
  appBarTheme: AppBarTheme(
    centerTitle: true,
    iconTheme: IconThemeData(
      color: Colors.white,
      size: 15,
      opacity: 1.0
    ),
    textTheme: TextTheme(
      title: TextStyle(color:Colors.white,fontSize: 15)
    )
  )
);

final ThemeData darkTheme = ThemeData(
  
  primaryColor: AppColors.primaryColor,
  brightness: Brightness.dark,
  buttonColor: Colors.orange,
  accentColor: Colors.redAccent,
  indicatorColor: Colors.red,
  toggleableActiveColor: Colors.red,
   appBarTheme: AppBarTheme(
    centerTitle: true,
    iconTheme: IconThemeData(
      color: Colors.white,
      size: 15,
      opacity: 1.0
    ),
    textTheme: TextTheme(
      title: TextStyle(color:Colors.white,fontSize: 15)
    )
));
