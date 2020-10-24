import 'package:digitalkarobaar/src/res/app_colors.dart';
import 'package:digitalkarobaar/src/res/app_text_style.dart';
import 'package:digitalkarobaar/src/route/router_name.dart';
import 'package:digitalkarobaar/src/ui/auth/account_info.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: 100,
                width: 100,
                //color: Colors.black12,
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Text('Welcome to Digital Karobaar',
                      style: AppTextStyles.medium20Black),
                  SizedBox(height: 20),
                  Text('Ab phone main hogi apni dukaan',
                      style: AppTextStyles.medium15Black),
                  SizedBox(height: 5),
                  Text('Retailers | Traders | Wholeselers',
                      style: AppTextStyles.medium15Black),
                  SizedBox(height: 5),
                  Text('Distributers | Manufactures | Brands',
                      style: AppTextStyles.medium15Black),
                  SizedBox(height: 20),
                  ButtonTheme(
                    minWidth: MediaQuery.of(context).size.width * 0.6,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: MaterialButton(
                      color: AppColors.primaryColor,
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, RouterName.termCondition);
                            
                      },
                      child: Text('Get Started',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
