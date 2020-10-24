import 'package:digitalkarobaar/src/core/widget/common_button.dart';
import 'package:digitalkarobaar/src/models/term_condition.dart';
import 'package:digitalkarobaar/src/repository/auth_repository.dart';
import 'package:digitalkarobaar/src/res/app_colors.dart';
import 'package:digitalkarobaar/src/route/router_name.dart';
import 'package:flutter/material.dart';

class TermAndCondition extends StatefulWidget {
  @override
  _TermAndConditionState createState() => _TermAndConditionState();
}

class _TermAndConditionState extends State<TermAndCondition> {
  bool termVal = true;
  bool condVal = true;
  TermCondition _termAndCondition;
  @override
  void initState() {
    _getTermAndPrivacy();
    super.initState();
  }

  _getTermAndPrivacy() async {
    try {
      _termAndCondition = await AuthRepository.getTermAndCondition();
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Account Information',
            style: TextStyle(color: Colors.white, fontSize: 18)),
        automaticallyImplyLeading: false,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(40))),
        //  bottom: _appBarBottom()
      ),
      body: Container(
      //  color: Colors.black12,
        child: ListView(
          children: <Widget>[
           
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30.0),
                    )),
                width: MediaQuery.of(context).size.width,
                height: 400,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 25.0, left: 15.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Checkbox(
                                value: termVal,
                                checkColor: Colors.white,
                                activeColor: AppColors.primaryColor,
                                focusColor:AppColors.primaryColor ,
                                onChanged: (bool value) {
                                  setState(() {
                                    termVal = value;
                                  });
                                }),
                           Text(
                             "Term of use",
                             style: TextStyle(
                                fontSize: 20.0),
                           )
                          ],
                        ),
                        SizedBox(height: 15.0),
                        Row(children: <Widget>[
                          Padding(padding: const EdgeInsets.only(left: 50.0)),
                          Text(
                              "By cliking 'Accept', you agree to Digital Karobaar's",
                              style: TextStyle(fontSize: 9.0)),
                        ]),
                        Row(children: <Widget>[
                          Padding(padding: const EdgeInsets.only(left: 50.0)),
                          InkWell(
                            onTap: (){
                              if (_termAndCondition != null) {
                                showAlertDialog(
                                    context,
                                    _termAndCondition.privacy,
                                    'Term of use');
                               } },
                            child: Text("Term of USe",
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 9.0)),
                          ),
                          SizedBox(width: 4.0),
                          Text("and", style: TextStyle(fontSize: 9.0)),
                          SizedBox(width: 4.0),
                          InkWell(
                            onTap: (){
                              if (_termAndCondition != null) {
                                showAlertDialog(
                                    context,
                                    _termAndCondition.privacy,
                                    'Privacy Policy');
                               } },
                            child: Text("Privacy Policy",
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 9.0)),
                          ),
                        ]),
                        SizedBox(height: 20.0),
                        Row(
                          children: <Widget>[
                            Checkbox(
                                value: condVal,
                                 checkColor: Colors.white,
                                activeColor: AppColors.primaryColor,
                                focusColor:AppColors.primaryColor ,
                                hoverColor: AppColors.primaryColor,
                               
                                onChanged: (bool value) {
                                  setState(() {
                                    condVal = value;
                                  });
                                }),
                            Text(
                              "Term and condition  ",
                              style: TextStyle(
                                  fontSize: 20.0),
                            ),
                          ],
                        ),
                        Row(children: <Widget>[
                          Padding(padding: const EdgeInsets.only(left: 50.0)),
                          Text(
                            "for Logistics Services",
                            style:
                                TextStyle(fontSize: 20.0),
                          ),
                        ]),
                        SizedBox(height: 10.0),
                        Row(children: <Widget>[
                          Padding(padding: const EdgeInsets.only(left: 50.0)),
                          Text(
                            "and Payment Services",
                            style:
                                TextStyle(fontSize: 20.0),
                          ),
                        ]),
                        SizedBox(height: 20.0),
                        Padding(
                          padding: const EdgeInsets.only(left: 35.0),
                          child: Column(
                            children: <Widget>[
                              Text(
                                  "By cliking 'Accept', you agree to Digital Karobaar's",
                                  style: TextStyle(fontSize: 9.0)),
                            ],
                          ),
                        ),
                        Row(children: <Widget>[
                          Padding(padding: const EdgeInsets.only(left: 50.0)),
                          InkWell(
                              onTap: () async {
                                if (_termAndCondition != null) {
                                  showAlertDialog(context,
                                      _termAndCondition.terms, 'Term of Use');
                                }
                              },
                              child: Text("Term of USe",
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 9.0))),
                          SizedBox(width: 4.0),
                          Text("and", style: TextStyle(fontSize: 9.0)),
                          SizedBox(width: 4.0),
                          InkWell(
                            onTap: () async {
                              if (_termAndCondition != null) {
                                showAlertDialog(
                                    context,
                                    _termAndCondition.privacy,
                                    'Privacy Policy');
                              }
                            },
                            child: Text("Privacy Policy",
                                style: TextStyle(
                                    color: Colors.blue, fontSize: 9.0)),
                          ),
                          SizedBox(width: 4.0),
                          Text("for avalling the",
                              style: TextStyle(fontSize: 9.0)),
                        ]),
                        Padding(
                          padding: const EdgeInsets.only(left: 40.0),
                          child: Column(children: <Widget>[
                            //Padding(padding: const EdgeInsets.only(left: 50.0)),
                            Text(
                              "Logistics Services and Payment Services from XYZ",
                              style: TextStyle(fontSize: 9.0),
                            ),
                          ]),
                        ),
                        Row(children: <Widget>[
                          Padding(padding: const EdgeInsets.only(left: 50.0)),
                          Text("Logistics Private Limited",
                              style: TextStyle(fontSize: 9.0)),
                        ]),
                        SizedBox(height: 40.0),

                        CommonButton(
                          title: "Accept & Continue",
                          buttonColor: AppColors.primaryColor,
                          onTap: () {
                           if(termVal && condVal){
                            
                             Navigator.of(context).pushReplacementNamed(RouterName.otp);
                             
                           }
                          },
                        )
                       
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context, String termCondition, String title) {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: ListView(
        shrinkWrap: true,
        children: [
          Text(termCondition,
              style: TextStyle(fontSize: 15, color: Colors.black54))
        ],
      ),
      actions: [
        okButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
