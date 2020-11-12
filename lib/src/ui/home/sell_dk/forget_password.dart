import 'package:digitalkarobaar/src/core/utils/constants/language_keys.dart';
import 'package:digitalkarobaar/src/core/widget/common_button.dart';
import 'package:digitalkarobaar/src/repository/sell_respository.dart';
import 'package:digitalkarobaar/src/res/app_colors.dart';
import 'package:digitalkarobaar/src/res/app_text_style.dart';
import 'package:digitalkarobaar/src/route/router_name.dart';
import 'package:flutter/material.dart';
import 'package:digitalkarobaar/src/core/utils/constants/common.dart';

class ForgetPassword extends StatelessWidget {
  //  SellRepository sellRepository = SellRepository();
  String _no;
  String _password;

  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  Widget _buildPhoneNo() {
    return SizedBox(
      height: 80,
      child: TextFormField(
          autofocus: true,
          textInputAction: TextInputAction.next,
          decoration: inputDecoration(hint: "Phone Number"),
          keyboardType: TextInputType.number,
          validator: (String value) {
            if (value.isEmpty) {
              return 'this is Required';
            }
            return null;
          },
          onSaved: (String value) {
            _no = value;
          }),
    );
  }

  Widget _buildPassword() {
    return SizedBox(
      height: 80,
      child: TextFormField(
          autofocus: true,
          textInputAction: TextInputAction.next,
          decoration: inputDecoration(hint: "New Password"),
          keyboardType: TextInputType.text,
          validator: (String value) {
            if (value.isEmpty) {
              return 'this is Required';
            }
            return null;
          },
          onSaved: (String value) {
            _password = value;
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 70),
              Container(
                  child: Form(
                      key: _form,
                      child: Column(children: [
                        _buildPhoneNo(),
                        //  SizedBox(height: 20),
                        _buildPassword(),
                        SizedBox(height: 20),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: []),
                        SizedBox(height: 20),
                        CommonButton(
                          buttonColor: AppColors.primaryColor,
                          title: LanguageKeys.submit.translate(context),
                          onTap: () {
                            if (_form.currentState.validate()) {
                              _form.currentState.save();
                             SellRepository.sellForgetPassword(_no, _password).then((value){
                               if(value.statusCode ==200){
                                   Navigator.pushNamed(context, RouterName.forgetOtp);

                               }
                            
                             } 
                             );
                            }
                          },
                        ),
                      ])))
            ],
          ),
        ));
  }
}
