import 'package:digitalkarobaar/src/core/utils/constants/common.dart';
import 'package:digitalkarobaar/src/core/utils/constants/language_keys.dart';
import 'package:digitalkarobaar/src/core/widget/common_button.dart';
import 'package:digitalkarobaar/src/repository/sell_respository.dart';
import 'package:digitalkarobaar/src/res/app_colors.dart';
import 'package:digitalkarobaar/src/res/app_text_style.dart';
import 'package:digitalkarobaar/src/route/router_name.dart';
import 'package:flutter/material.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class SellOnDigitalKarobaar extends StatefulWidget {
  @override
  _SellOnDigitalKarobaarState createState() => _SellOnDigitalKarobaarState();
}

class _SellOnDigitalKarobaarState extends State<SellOnDigitalKarobaar> {
  String _no;
  String _password;

  SellRepository sellRepository = SellRepository();

  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  Widget _buildNo() {
    return TextFormField(
      decoration:
          inputDecoration(hint: LanguageKeys.mobileNo.translate(context)),
      keyboardType: TextInputType.number,
      validator: (String value) {
        if (value.isEmpty) {
          return 'this is Required';
        }
        return null;
      },
      onSaved: (String value) {
        _no = value;
      },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
        decoration: inputDecoration(
          hint: LanguageKeys.pssword.translate(context),
        ),
        keyboardType: TextInputType.text,
        validator: (String value) {
          Validators.patternString(
              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
              'Invalid Password');
          if (value.isEmpty) {
            return 'this is Required';
          }
          return null;
        },
        onSaved: (String value) {
          _password = value;
        });
  }

  @override
  void initState() {
    _checkSellerLogin();
    super.initState();
  }

  _checkSellerLogin() async {
    final accessSellerToken = await getSellerDashToken();
    if (accessSellerToken != null) {
      Navigator.pushReplacementNamed(context, RouterName.sellerDash);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            LanguageKeys.sellOnDigialKarobaar.translate(context),
            style: TextStyle(color: Colors.white),
          ),
          leading: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(Icons.arrow_back_ios, color: Colors.white)),
          actions: [
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RouterName.sellLogin);
                },
                child: Padding(
                  padding:
                      const EdgeInsets.only(right: 10.0, top: 10, bottom: 10),
                  child: Container(
                    width: 70,
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        LanguageKeys.login.translate(context),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ))
          ],
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15),
              child: Column(children: <Widget>[
                SizedBox(height: 20),

                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          "Sell on DigitalKarobaar :",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Center(
                    child: Text(
                        "Seamless Logistics, Secure payments and Nationwide Coverage of your brand ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15))),
                SizedBox(height: 10),
                Center(
                    child: Text(
                        " Make your Business go online with DigitalKarobaar and increase your sales 10X than your current ones.",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15))),
                //SizedBox(height: 10),
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          "Sign up as a seller now!",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          "On DigitalKarobaar -",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Center(
                    child: Text(
                        "Get bulk orders directory from Outstation parties. No middlemen. Increased profits. Hassle - free sales, all through DigitalKarobaar. ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15))),

                SizedBox(height: 50),
                Text(
                  "Seller Signup form",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 20),
                Container(
                    child: Form(
                        key: _form,
                        child: Column(children: [
                          _buildNo(),
                          SizedBox(height: 20),
                          _buildPassword(),
                          SizedBox(height: 20),
                          CommonButton(
                            title:
                                LanguageKeys.saveAndVerify.translate(context),
                            //"Save and Verify",
                            buttonColor: AppColors.primaryColor,
                            height: 35,
                            onTap: () {
                         

                              if (_form.currentState.validate()) {
                                _form.currentState.save();
                                sellRepository
                                    .onSellRegistration(
                                  _no,
                                  _password,
                                )
                                    .then((response) {
                                  if (response.statusCode == 200) {
                                    Navigator.pushReplacementNamed(
                                        context, RouterName.sellOtp);
                                  }
                                });
                              }
                            },
                          ),
                        ]))),
                SizedBox(height: 50),
              ]),
            )
          ],
        ));
  }
}
