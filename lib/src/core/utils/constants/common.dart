import 'package:digitalkarobaar/src/res/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../localization_helper.dart';
import '../preference_helper.dart';

extension StringTranslator on String {
  String translate(BuildContext context) {
    return AppLocalizations.of(context).translate(this);
  }
}

 showMessagess(String msg){
  Fluttertoast.showToast(
    backgroundColor: AppColors.primaryColor,
    msg: msg);
}


 getSellerDashToken() async{
    final token= await PreferenceHelper.getSellerTokenDash();
    return token;
  }
  getSellerToken() async{
    final token= await PreferenceHelper.getSellAccessToken();
    return token;
  }
  getMemberToken() async{
    final token= await PreferenceHelper.getMemberToken();
    return token;
  }
  getAccessToken() async{
    final token= await PreferenceHelper.getAccessToken();
    return token;
  }
  createDateFormate(String startDate) {
    return startDate.substring(0, startDate.indexOf('T')) ?? '';
  }


  
