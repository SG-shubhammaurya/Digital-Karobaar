import 'dart:async';

import 'package:digitalkarobaar/src/route/router_name.dart';
import 'package:flutter/material.dart';

import 'res/app_colors.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // AppRepository appRepository = AppRepository();

  @override
  void initState() {
    super.initState();
    startTime();
  }

  Future<void> startTime() async {
    var _duration = new Duration(milliseconds: 1500);
    Timer(_duration, navigationPage);
  }

  navigationPage() async {
    await Navigator.pushReplacementNamed(context, RouterName.initialRoute);
  }

  @override
  Widget build(BuildContext context) {
     
    return SizedBox(
     
      child: Scaffold(
         backgroundColor: AppColors.primaryColor,
        body: Center(
          child: Card(
            
            child: Image.asset(
            'assets/icons/launcher.jpeg',
            height: 150,
            width: 150,
          ),
          )
        ),
      ),
    );
  }
}