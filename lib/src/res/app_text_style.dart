 import 'package:digitalkarobaar/src/res/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyles{
   static TextStyle get medium20Black =>TextStyle(
                       
                          fontWeight: FontWeight.bold,
                          fontSize: 20);
   
   
   static TextStyle get medium15Black =>TextStyle( fontSize: 15) ; 
 }
 inputDecoration({String hint,bool isPasswordField}) =>InputDecoration(
                           hintStyle: TextStyle(
                             fontSize: 12
                           ),
        hintText: hint,
     
        contentPadding:
            EdgeInsets.only(left: 25.0, top: 10.0, right: 10.0, bottom: 10.0),
    
        border: InputBorder.none,
        disabledBorder:OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(width: 2,color: AppColors.primaryColor)) ,
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(width: 2,color: AppColors.primaryColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(width: 2,color: AppColors.primaryColor)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide( color: AppColors.primaryColor))
                        );