import 'package:digitalkarobaar/src/core/widget/common_button.dart';
import 'package:digitalkarobaar/src/res/app_colors.dart';
import 'package:digitalkarobaar/src/route/router_name.dart';
import 'package:flutter/material.dart';

class SubmitForm extends StatefulWidget {
  @override
  _SubmitFormState createState() => _SubmitFormState();
}

class _SubmitFormState extends State<SubmitForm> {
  bool termVal = true;

  bool condVal = true;
  final terms =
      'I have read and understand the terms and conditions and seller argreement and agree to abide by them at all times.';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SubmitForm'),
      ),
      body: Column(
       
        children: [
           const SizedBox(height: 20),
          Row(
            children: [
              Checkbox(
                  value: condVal,
                  checkColor: Colors.white,
                  activeColor: AppColors.primaryColor,
                  focusColor: AppColors.primaryColor,
                  hoverColor: AppColors.primaryColor,
                  onChanged: (bool value) {
                    setState(() {
                      condVal = value;
                    });
                  }),
              SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width * .8,
                child: Text(
                  terms,
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: MediaQuery.of(context).size.width * .8,
            child: Text(
                'Please review the form before submitting. After submitting the form will get locket and thereafter for any change you may contact 8006892892.'),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CommonButton(
                  buttonColor: AppColors.primaryColor,
                  titleColor: Colors.white,
                  title: "Submit Form",
                  onTap: () {
                    Navigator.pushReplacementNamed(context, RouterName.sellLogin);
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
