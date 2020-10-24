import 'dart:async';

import 'package:digitalkarobaar/src/core/widget/common_button.dart';
import 'package:digitalkarobaar/src/repository/sell_respository.dart';
import 'package:digitalkarobaar/src/res/app_colors.dart';
import 'package:digitalkarobaar/src/route/router_name.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
class MemberForgetVerify extends StatefulWidget {
  @override
  _MemberForgetVerifyState createState() => _MemberForgetVerifyState();
}

class _MemberForgetVerifyState extends State<MemberForgetVerify> {

  SellRepository sellRepository = SellRepository();
  var onTapRecognizer;
  StreamController<ErrorAnimationType> errorController;
  final formKey = GlobalKey<FormState>();

  TextEditingController textEditingController =  TextEditingController();
  String currentText= "";






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar
      (
        title: Text("Member Password Verify"),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Column(
            children: [
              Text(
                "OTP Verification Code",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                height: 200,
                width: 300,
                //color: Colors.blue
                child: Image.asset("assets/icons/indexotp.jpg"),
              ),
              SizedBox(height: 40),
              Text("We have send an OTP on your no."),
              SizedBox(height: 10),
              Text("Please verify it for reset the"),
              SizedBox(height: 10.0,),
              Text("member Password"),
              SizedBox(height: 35),
              Form(
                key: formKey,
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 30),
                    child: PinCodeTextField(

                      
                      appContext: context,
                      length: 4,
                      animationDuration: Duration(milliseconds: 300),
                      errorAnimationController: errorController,
                      controller: textEditingController,
                      backgroundColor: Colors.black12,
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          currentText = value;
                        });
                      },
                    )),
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CommonButton(
                width: 100,
                title: "clear",
                buttonColor: AppColors.primaryColor,
                onTap: () {
                  textEditingController.clear();
                },
              ),
              SizedBox(
                width: 100,
              ),
              CommonButton(
                width: 100,
                title: "Verify",
                buttonColor: AppColors.primaryColor,
                onTap: () {
                  //Navigator.pushReplacementNamed(context,RouterName.memberLogin);
                  if (formKey.currentState.validate()) {
                    sellRepository
                        .verifyMemberForgetPassword(textEditingController.text).then((value){
                         Navigator.pushReplacementNamed(context,RouterName.memberLogin);
                        });
                  }
                },
              ),
            ],
          )
        ],
      ),
      
    );
  }
}