import 'dart:async';
import 'package:digitalkarobaar/src/bloc/otp/optlogin_state.dart';
import 'package:digitalkarobaar/src/bloc/otp/otp_cubit.dart';
import 'package:digitalkarobaar/src/core/utils/constants/common.dart';
import 'package:digitalkarobaar/src/core/utils/preference_helper.dart';
import 'package:digitalkarobaar/src/core/widget/common_button.dart';
import 'package:digitalkarobaar/src/res/app_colors.dart';
import 'package:digitalkarobaar/src/route/router_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PhoneOtp extends StatefulWidget {
  @override
  _PhoneOtpState createState() => _PhoneOtpState();
}

class _PhoneOtpState extends State<PhoneOtp>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    otpCubit = BlocProvider.of<OtpCubit>(context);
    totalTimeInSeconds = time;

    super.initState();
    // _controller =
    //     AnimationController(vsync: this, duration: Duration(seconds: time))
    //       ..addStatusListener((status) {
    //         if (status == AnimationStatus.dismissed) {
    //           setState(() {
    //             _hideResendButton = !_hideResendButton;
    //           });
    //         }
    //       });
    // _controller.reverse(
    //  from: _controller.value == 0.0 ? 1.0 : _controller.value);
    _initPrefs();

    super.initState();
  }

  String currentText = "";

  _initPrefs() async {
    prefs = await PreferenceHelper.instance;
  }

  Size _screenSize;
  PreferenceHelper prefs;
// Constants
  final int time = 30;
 // AnimationController _controller;

  // Variables
  String _phoneNumber;
  List<GlobalKey<FormState>> formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>()
  ];

  OtpCubit otpCubit;
  String id;
  TextEditingController __firstDigitController = TextEditingController();
  FocusNode firstDigitFocusNode = FocusNode();

  Timer timer;
  int totalTimeInSeconds;
  //bool _hideResendButton = true;
  String otp;
  bool otpForNewUser;

  @override
  Widget build(BuildContext context) {
    _screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Verification',
            style: TextStyle(color: Colors.white, fontSize: 18)),
        automaticallyImplyLeading: false,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(55))),
        //  bottom: _appBarBottom()
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: ListView(
          addAutomaticKeepAlives: true,
          children: [
            Column(
              children: [
                SizedBox(height: 20),
                Text("Type Your Phone Number", style: TextStyle(fontSize: 18)),
                Form(
                  key: formKeys[0],
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(),
                        validator: (val) => validateMobile(val),
                        onSaved: (String value) {
                          _phoneNumber = value;
                        },
                      )),
                ),
                SizedBox(height: 20),
                BlocListener(
                  cubit: otpCubit,
                  listener: (BuildContext context, OtpLoginState state) {
                    if (state is OtpVerifySuccessfulState) {
                      id = state.id.toString();
                      showMessagess('"Otp Verified');

                      _navigateToRegistration(context, id);
                    }
                  },
                  child: BlocBuilder<OtpCubit, OtpLoginState>(
                      cubit: otpCubit,
                      builder: (context, state) {
                        if (state is IdleState) {}
                        // if (state is OtpVerifySuccessfulState) {
                        //   id = state.id.toString();
                        //   Fluttertoast.showToast(
                        //       backgroundColor: AppColors.primaryColor,
                        //       textColor: Colors.white,
                        //       msg: "Otp Verified");

                        //   _navigateToRegistration(context, id);
                        // }
                        if (state is ShowErrorState) {
                          Fluttertoast.showToast(
                              backgroundColor: AppColors.primaryColor,
                              textColor: Colors.white,
                              msg: state.message ?? "Somthing Wrong!!");
                        }

                        return Column(
                          children: [
                            CommonButton(
                              title: 'Confirm',
                              height: 30,
                              width: 180,
                              buttonColor: AppColors.primaryColor,
                              onTap: () async {
                                if (formKeys[0].currentState.validate()) {
                                  formKeys[0].currentState.save();
                                  otpCubit.sendNumber(_phoneNumber);

                                  //save

                                  prefs.setPhoneNumber(_phoneNumber);
                                }
                              },
                            ),
                            state is ConfirmOtpLoading
                                ? Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : SizedBox()
                          ],
                        );
                      }),
                )
              ],
            ),
            SizedBox(height: 30),
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              decoration: ShapeDecoration(
                  color: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(30)))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: 20),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .9,
                    child: Text(
                      "Type Your OTP",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text('Enter the verification code we just sent to',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15)),
                  Text('your phone number',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15)),
                  SizedBox(height: 20),
                  Form(
                    key: formKeys[1],
                    child: Container(
                        width: _screenSize.width,
                        padding: new EdgeInsets.only(bottom: 16.0),
                        child:
                            // _getInputPart,
                            Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: PinCodeTextField(
                            appContext: context,
                            length: 4,
                            animationDuration: Duration(milliseconds: 300),

                            // errorAnimationController: errorController,
                            controller: __firstDigitController,
                            backgroundColor: AppColors.primaryColor,
                            onChanged: (value) {
                              setState(() {
                                currentText = value;
                              });
                            },
                          ),
                        )),
                  ),
                  SizedBox(height: 10),
                  BlocListener<OtpCubit, OtpLoginState>(
                    cubit: otpCubit,
                    listener: (BuildContext context, OtpLoginState state) {
                      if (state is GoToHomePageState) {
                        showMessagess('Otp Verified');
                        _navigateToHomePage();
                      }
                    },
                    child: BlocBuilder<OtpCubit, OtpLoginState>(
                        cubit: otpCubit,
                        builder: (c, state) {
                          if (state is PhoneNumberVerify) {
                            otpForNewUser = true;
                            Fluttertoast.showToast(
                                backgroundColor: AppColors.primaryColor,
                                textColor: Colors.white,
                                msg: "Otp Sent");
                            prefs.setOtpForNewUser(otpForNewUser);
                          }

                          if (state is LoginOtpVerify) {
                            otpForNewUser = false;
                            Fluttertoast.showToast(
                                backgroundColor: AppColors.primaryColor,
                                textColor: Colors.white,
                                msg: "Otp Sent");
                            prefs.setOtpForNewUser(otpForNewUser);
                          }

                          return CommonButton(
                            title: 'Continue',
                            titleColor: AppColors.primaryColor,
                            onTap: () {
                              if (formKeys[1].currentState.validate()) {
                                otp = __firstDigitController.text;

                                //phone no
                                if (_phoneNumber == null) {
                                  _phoneNumber = prefs.phoneNo;
                                }

                                if (otpForNewUser == null) {
                                  otpForNewUser = prefs.otpForNewUser;
                                }

                                otpForNewUser
                                    ? otpCubit.otpForNewUser(
                                        _phoneNumber, otp.toString())
                                    : otpCubit.otpForRegisteredUser(otp);
                              }
                            },
                          );
                        }),
                  ),
                  SizedBox(height: 5),
                  BlocBuilder<OtpCubit, OtpLoginState>(
                      builder: (context, state) {
                    if (state is PhoneNumberVerify) {
                      //return
                    }

                    return SizedBox();
                  })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String validateMobile(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }

  get _getInputPart {
    return new Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _getInputField,
        SizedBox(height: 20),
        //   _hideResendButton ? _getTimerText : _getResendButton,
        // _getOtpKeyboard
      ],
    );
  }

  get _getInputField {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        //  OTPTextField(
        //    controller: __firstDigitController;

        //   length: 4,
        //   width: MediaQuery.of(context).size.width,
        //   textFieldAlignment: MainAxisAlignment.spaceAround,
        //   fieldWidth: 50,
        //   fieldStyle: FieldStyle.box,
        //   style: TextStyle(

        //     fontSize: 17
        //   ),
        //   onChanged: ( String value){
        //    setState(() {
        //      currentText = value;
        //    });
        //   },
        //  )

        // _otpTextField(__firstDigitController,firstDigitFocusNode),
        // _otpTextField(__secondDigitController,secondDigiFocusNode),
        // _otpTextField(__thirdDigitController,thirdDigitFocusNode),
        // _otpTextField(__fourthDigitController,fourthDigitFocusNode),
      ],
    );
  }

  get _getResendButton {
    return new InkWell(
      child: Text('ReSend OTP', style: TextStyle(color: Colors.white)),
      onTap: () {
        if (formKeys[0].currentState.validate()) {
          formKeys[0].currentState.save();
          otpCubit.sendNumber(_phoneNumber);
        }
      },
    );
  }

  @override
  void dispose() {
   // _controller.dispose();
    super.dispose();
  }

  Widget _otpTextField(TextEditingController controller, FocusNode focusNode) {
    return OTPTextField(
      length: 4,
      width: MediaQuery.of(context).size.width,
      textFieldAlignment: MainAxisAlignment.spaceAround,
      fieldWidth: 50,
      fieldStyle: FieldStyle.box,
      style: TextStyle(fontSize: 17),
      onChanged: (String value) {
        setState(() {
          currentText = value;
        });
      },
      // onCompleted: (String value){
      //   setState(() {
      //     __firstDigitController = value as TextEditingController;
      //   });
    );

    // Container(
    //     height: 60,
    //     width: 150,
    //     decoration: ShapeDecoration(
    //         color: Colors.white12,
    //         shape: RoundedRectangleBorder(
    //             borderRadius: BorderRadius.circular(15))),
    //     child: TextFormField(
    //         maxLength: 4,

    //         textAlign: TextAlign.center,
    //         controller: controller,
    //         decoration: InputDecoration(
    //           border: InputBorder.none,

    //           ),
    //         keyboardType: TextInputType.number,

    //         validator: (String value) {
    //           if (value.isEmpty) {
    //             return 'otp is Required';
    //           }
    //           return null;
    //         },
    //         onSaved: (String value) {}
    //         )

    //         );
  }

  _navigateToRegistration(BuildContext context, String id) async {
    await Navigator.pushReplacementNamed(context, RouterName.registration,
        arguments: id);
  }

  _navigateToHomePage() async {
    await Navigator.pushReplacementNamed(
      context,
      RouterName.mainPage,
    );
  }
}
