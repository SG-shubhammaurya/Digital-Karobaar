import 'package:digitalkarobaar/src/bloc/registration/registration_cubit.dart';
import 'package:digitalkarobaar/src/bloc/registration/registration_state.dart';
import 'package:digitalkarobaar/src/core/widget/common_button.dart';
import 'package:digitalkarobaar/src/res/app_colors.dart';
import 'package:digitalkarobaar/src/route/router_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AccountInfo extends StatefulWidget {
  final id;
  AccountInfo({@required this.id});
  @override
  _AccountInfoState createState() => _AccountInfoState();
}

class _AccountInfoState extends State<AccountInfo> {
  String _name;
  String _business;
  String _pincode;
  RegistrationCubit registrationCubit;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          labelText: "name",
        ),
        keyboardType: TextInputType.text,
        validator: (String value) {
          if (value.isEmpty) {
            return 'this is Required';
          }
          return null;
        },
        onSaved: (String value) {
          _name = value;
        });
  }

  Widget _buildBusiness() {
    return TextFormField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(labelText: "Business or Shop Name"),
        keyboardType: TextInputType.text,
        validator: (String value) {
          if (value.isEmpty) {
            return 'this is Required';
          }
          return null;
        },
        onSaved: (String value) {
          _business = value;
        });
  }

  Widget _buildPinCode() {
    return TextFormField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(labelText: "Pincode"),
        keyboardType: TextInputType.number,
        validator: (String value) {
          if (value.isEmpty) {
            return 'this is Required';
          }
          return null;
        },
        onSaved: (String value) {
          _pincode = value;
        });
  }

  @override
  void initState() {
    registrationCubit = BlocProvider.of<RegistrationCubit>(context);
    super.initState();
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
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(55))),
        //  bottom: _appBarBottom()
      ),
      body: ListView(
        children: <Widget>[
          // Container(
          //   decoration: BoxDecoration(
          //       color: AppColors.primaryColor,
          //       borderRadius: BorderRadius.only(
          //         bottomLeft: const Radius.circular(50.0),
          //         bottomRight: const Radius.circular(50.0),
          //       )),
          //   width: MediaQuery.of(context).size.width,
          //   height: 110,
          //   child: Container(
          //     child: Center(
          //       child: Padding(
          //         padding: const EdgeInsets.only(top: 50.0),
          //         child: Text(
          //           "Account Information",
          //           style: TextStyle(color: Colors.white, fontSize: 25.0),
          //           textAlign: TextAlign.justify,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          SizedBox(height: 40.0),
          Center(
            child: Column(
              children: <Widget>[
                Text("Register your business on ",
                    style: TextStyle(fontSize: 18.0)),
                Text("Digital Karobaar", style: TextStyle(fontSize: 18.0))
              ],
            ),
          ),
          SizedBox(height: 20.0),
          Container(
              child: Form(
                  key: _formKey,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            _buildName(),
                            _buildBusiness(),
                            _buildPinCode(),
                            SizedBox(height: 30),
                            CommonButton(
                              title: "Next",
                              buttonColor: AppColors.primaryColor,
                              height: 35,
                              onTap: () {
                                if (!_formKey.currentState.validate()) {
                                  return null;
                                }
                                _formKey.currentState.save();
                                print(_name);
                                print(_business);
                                print(_pincode);

                                //save info
                                registrationCubit.sendData(
                                    _name, _business, _pincode, widget.id);
                              },
                            ),
                          ])))),
          BlocConsumer<RegistrationCubit, RegistrationState>(
              cubit: registrationCubit,
              builder: (context, state) {
                if (state is RegistrationLoadingSate) {
                  return Center(child: CircularProgressIndicator());
                }

                return SizedBox();
              },
              listener: (context, state) {
                if (state is RegistrationSuccessfulState) {
                  Fluttertoast.showToast(
                      backgroundColor: AppColors.primaryColor,
                      textColor: Colors.white,
                      msg: "Registration Successfully");

                  _navigationToHome(context);
                }
                if (state is RegistrationErrorState) {
                  Fluttertoast.showToast(
                      backgroundColor: AppColors.primaryColor,
                      textColor: Colors.white,
                      msg: "Somthing Wrong!!");
                }
              })
        ],
      ),
    );
  }

  _navigationToHome(BuildContext context) async {
    try {
    //  WidgetsBinding.instance.addPostFrameCallback((_) {
       await Navigator.pushReplacementNamed(context, RouterName.mainPage);
     // });
    } catch (e) {}
  }
}
