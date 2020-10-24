
import 'package:digitalkarobaar/src/res/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoDataAvailable extends StatelessWidget {
  NoDataAvailable({this.message});
  final message;
  @override
  Widget build(BuildContext context) {
    return message !=null ? Text(message,style: GoogleFonts.poppins(
      fontWeight: FontWeight.bold,
      color: AppColors.primaryColor
    )) : Text("Not Available",style: GoogleFonts.poppins(
      fontWeight: FontWeight.bold,
      color: AppColors.primaryColor
    ));
  }
}