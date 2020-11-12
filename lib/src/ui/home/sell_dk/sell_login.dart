import 'package:digitalkarobaar/src/core/utils/constants/language_keys.dart';
import 'package:digitalkarobaar/src/core/widget/common_button.dart';
import 'package:digitalkarobaar/src/repository/sell_respository.dart';
import 'package:digitalkarobaar/src/res/app_colors.dart';
import 'package:digitalkarobaar/src/res/app_text_style.dart';
import 'package:digitalkarobaar/src/route/router_name.dart';
import 'package:flutter/material.dart';
import 'package:digitalkarobaar/src/core/utils/constants/common.dart';


class SellLogin extends StatefulWidget {
  @override
  _SellLoginState createState() => _SellLoginState();
}

class _SellLoginState extends State<SellLogin> {
  SellRepository sellRepository = SellRepository();
  String _no;
  String _password;

  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  Widget _buildPhoneNo() {
    return SizedBox(
      height: 80,
      child: TextFormField(
          textInputAction: TextInputAction.next,
          decoration: inputDecoration(
            hint:
             LanguageKeys.mobileNo.translate(context),
             ),
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
          textInputAction: TextInputAction.next,
          decoration: inputDecoration(
            hint:
             LanguageKeys.pssword.translate(context),
             isPasswordField: true),
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
      appBar: AppBar(
        title: Text(
          LanguageKeys.login.translate(context),
          //"Login",
          style: TextStyle(color: Colors.white),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () {
                Navigator.of(context).pop();
              },
              tooltip: "Back",
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(children: [
          SizedBox(height: 70),
          Center(
            child: Text(
              LanguageKeys.sellerLogin.translate(context),
              //"Seller Login",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          SizedBox(height: 20),
          Container(
              child: Form(
                  key: _form,
                  child: Column(children: [
                    _buildPhoneNo(),
                    //  SizedBox(height: 20),
                    _buildPassword(),
                    SizedBox(height: 20),
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, RouterName.sellForgotPassword);
                        },
                        child: Container(
                          child: Text(
                            LanguageKeys.forgotPassword.translate(context),
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                    ]),
                    SizedBox(height: 20),
                    CommonButton(
                      title: LanguageKeys.login.translate(context),
                      buttonColor: AppColors.primaryColor,
                      onTap: () {
       
                        if (_form.currentState.validate()) {
                          _form.currentState.save();
                          sellRepository.sellLogin(_no, _password).then((value) {

                            if(value?.statusCode == 200){
                               Navigator.pushReplacementNamed(context, RouterName.sellerDash);

                            }


                          });
                        }
                      },
                    ),
                  ])))
        ]),
      ),
    );
  }
}
