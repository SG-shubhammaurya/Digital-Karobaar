import 'package:digitalkarobaar/src/core/widget/common_button.dart';
import 'package:digitalkarobaar/src/repository/sell_respository.dart';
import 'package:digitalkarobaar/src/res/app_colors.dart';
import 'package:digitalkarobaar/src/res/app_text_style.dart';
import 'package:digitalkarobaar/src/route/router_name.dart';
import 'package:flutter/material.dart';
class MemberLogin extends StatefulWidget {
  @override
  _MemberLoginState createState() => _MemberLoginState();
}

class _MemberLoginState extends State<MemberLogin> {
  String _no;
  String _password;
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  SellRepository sellRepository = SellRepository();




  Widget _buildPhoneNo() {
    return SizedBox(
      height: 80,
      child: TextFormField(
          textInputAction: TextInputAction.next,
          decoration: inputDecoration(hint: "Mobile No"),
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
          decoration: inputDecoration(hint: "Password",isPasswordField: true),
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
        title: Text("Member Login")
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(children: [
          SizedBox(height: 70),
          Center(
            child: Text(
              "Member Login",
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
                              context, RouterName.memberForgetPassword);
                        },
                        child: Container(
                          height: 30,
                          child: Text(
                            "Forgot Password ?",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                    ]),
                    SizedBox(height: 20),
                    CommonButton(
                      title: "Login",
                      buttonColor: AppColors.primaryColor,
                      onTap: () {
                     //   Navigator.pushNamed(context, RouterName.sellerDetails);
                        if (_form.currentState.validate()) {
                          _form.currentState.save();
                          sellRepository.memberLogin(_no, _password).then((response) {

                            if(response.statusCode == 200){
                               Navigator.pushReplacementNamed(context, RouterName.memberUploadProducts);

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