import 'package:digitalkarobaar/src/core/widget/common_button.dart';
import 'package:digitalkarobaar/src/repository/sell_respository.dart';
import 'package:digitalkarobaar/src/res/app_colors.dart';
import 'package:digitalkarobaar/src/res/app_text_style.dart';
import 'package:digitalkarobaar/src/route/router_name.dart';
import 'package:flutter/material.dart';
import 'package:wc_form_validators/wc_form_validators.dart';
class Manage extends StatefulWidget {
  @override
  _ManageState createState() => _ManageState();
}

class _ManageState extends State<Manage> {
  String _memberNo;
  String _password;
  String _sellerNo;
  SellRepository sellRepository = SellRepository();
  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  Widget _buildMemberNo() {
    return TextFormField(
      decoration: inputDecoration(hint: "Mobile No"),
      keyboardType: TextInputType.number,
      validator: (String value) {
        if (value.isEmpty) {
          return "this is required";
        }
        return null;
      },
      onSaved: (String value) {
        _memberNo = value;
      },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
        decoration: inputDecoration(hint: "Password"),
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
  Widget _buildSellerNo() {
    return TextFormField(
      decoration: inputDecoration(hint: "Seller Mobile No"),
      keyboardType: TextInputType.number,
      validator: (String value) {
        if (value.isEmpty) {
          return "this is required";
        }
        return null;
      },
      onSaved: (String value) {
        _sellerNo = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [

          Container(
            child: Form(
              key: _form,
              child: Column(children: [
              SizedBox(height:50.0),
              Padding(
                padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                child: Center(
                  child: Text("Please Provide the given details for joining the seller team for better business growth"),
                ),
              ),
              SizedBox(height: 50),
              _buildMemberNo(),
              SizedBox(height: 20,),
              _buildPassword(),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                child: Center(
                  child: Text("Enter the Seller number.To whom you want to join and ask for One Time Password for Verification"),
                ),
              ),
              SizedBox(height: 20,),
              _buildSellerNo(),

              SizedBox(height: 20.0),
              Row(
                
                children: [
                  SizedBox(width: 30.0,),

                  GestureDetector(
                    onTap: (){
                      
                      //Navigator.pushNamed(context, RouterName.memberVerifyOtp);
                      if (_form.currentState.validate()) {
                                _form.currentState.save();
                                sellRepository
                                    .onMemberRegister(
                                  _memberNo,
                                  _password,
                                  _sellerNo,
                                )
                                    .then((response) {
                                  if (response.statusCode == 200) {
                                    Navigator.pushNamed(
                                        context, RouterName.memberVerifyOtp);
                                  }
                                });
                              }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: 50.0,
                      width: 100.0,
                      child: Center(child: Text("SignUp"))
                    )
                  ),
                  SizedBox(width: 100),
                   GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, RouterName.memberLogin);

                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: 50.0,
                      width: 100.0,
                      child: Center(child: Text("Login"))
                    )
                  )
              
                ]
              )


              // CommonButton(
              //               title: "Save and Verify",
              //               buttonColor: AppColors.primaryColor,
              //               height: 35,
              //               onTap: () {
              //                 Navigator.pushNamed(context, RouterName.sellerDash);
                            
              //                 // if (_form.currentState.validate()) {
              //                 //   _form.currentState.save();
              //                 //   sellRepository
              //                 //       .onSellRegistration(
              //                 //     _no,
              //                 //     _password,
              //                 //   )
              //                 //       .then((response) {
              //                 //     if (response.statusCode == 200) {
              //                 //       Navigator.pushNamed(
              //                 //           context, RouterName.sellOtp);
              //                 //     }
              //                 //   });
              //                 // }
              //               },
              //             ),



            ],),)
          )

        ]
      ),
      
    );
  }
}