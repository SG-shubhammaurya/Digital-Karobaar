import 'package:digitalkarobaar/src/core/utils/constants/common.dart';
import 'package:digitalkarobaar/src/core/widget/common_button.dart';
import 'package:digitalkarobaar/src/models/search_pincode_by.dart';
import 'package:digitalkarobaar/src/repository/sell_respository.dart';
import 'package:digitalkarobaar/src/res/app_colors.dart';
import 'package:digitalkarobaar/src/res/app_text_style.dart';
import 'package:digitalkarobaar/src/route/router_name.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PickupDetails extends StatefulWidget {
  final sellerDetailId;
  PickupDetails(this.sellerDetailId);

  @override
  _PickupDetailsState createState() => _PickupDetailsState();
}

class _PickupDetailsState extends State<PickupDetails> {
  List profileType = ['Footwear Wholesaler', 'Footwear Manufacturer'];

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var pinCode;

  var addressLine1;

  var addressLine2;

  var city;

  var state;

  List<dynamic> pincodeDetails = [];
  _getPinCode(String code) async {
    //  pincodeDetails = [Data(stateName: "")];
    final details = await SellRepository.stateCity(code).catchError((e) {
      showMessagess('Picode Not Found');
    });
    if (details != null) {
      setState(() {
        pincodeDetails = details;
        // print(pincodeDetails[0]);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pickup Details')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const SizedBox(height: 10),
              const Text("Pincode"),
              const SizedBox(height: 10),
              TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  validator: (val) {
                    if (val.isEmpty) {
                      return "This is Required";
                    } else if (val.length < 6) {
                      return "Enter Valid PinCode";
                    }
                  },
                  onSaved: (pin) {
                    pinCode = pin;
                  },
                  onChanged: (val) {
                    if (val.length == 6) {
                      _getPinCode(val);
                    } else {
                      Fluttertoast.showToast(msg: 'Enter 6 digit Number');
                    }
                  },
                  textInputAction: TextInputAction.next,
                  decoration: inputDecoration(hint: "Your Billing Pincode")),
              const SizedBox(height: 10),
              Text("Address Line1"),
              SizedBox(height: 10),
              TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.text,
                  onSaved: (add) {
                    addressLine1 = add;
                  },
                  validator: (val) {
                    if (val.isEmpty) {
                      return "This is Required";
                    }
                    return null;
                  },
                  onChanged: (val) {},
                  textInputAction: TextInputAction.next,
                  decoration: inputDecoration(hint: "Your Address Line1")),
              const SizedBox(height: 10),
              Text("Address Line2"),
              SizedBox(height: 10),
              TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.text,
                  onSaved: (add) {
                    addressLine2 = add;
                  },
                  validator: (val) {
                    if (val.isEmpty) {
                      return "This is Required";
                    }
                    return null;
                  },
                  onChanged: (val) {},
                  textInputAction: TextInputAction.next,
                  decoration: inputDecoration(hint: "Your Address Line2")),
              SizedBox(height: 10),
              // auto slacted
              const SizedBox(height: 10),
              const Text("City"),
              const SizedBox(height: 10),
              pincodeDetails.length == 0
                  ? Text('Enter PinCode First ')
                  : DropdownButtonFormField<String>(
                      autofocus: true,
                      value: null,
                      items: [
                        DropdownMenuItem<String>(
                            value: pincodeDetails[0].state,
                            child: Text(
                              pincodeDetails[0].state,
                              style: TextStyle(fontSize: 14),
                            )),
                      ],
                      onChanged: (val) {},
                      decoration: inputDecoration(hint: "state"),
                    ),
              // auto slacted
              const SizedBox(height: 10),
              const Text("State"),
              const SizedBox(height: 10),
              pincodeDetails.length == 0
                  ? Text('Enter PinCode First ')
                  : DropdownButtonFormField<String>(
                      autofocus: true,
                      value: null,
                      items: [
                        DropdownMenuItem<String>(
                            value: pincodeDetails[0].state,
                            child: Text(
                              pincodeDetails[0].state,
                              style: TextStyle(fontSize: 14),
                            )),
                      ],
                      // items: pincodeDetails[0].map((e) {
                      //   return DropdownMenuItem<String>(
                      //       value: e.stateName,
                      //       child: Text(
                      //         e.toString(),
                      //         style: TextStyle(fontSize: 14),
                      //       ));
                      // }).toList(),
                      onChanged: (val) {},
                      // validator: (val) {
                      //   if (val.isEmpty) {
                      //     return "This is Required";
                      //   }
                      //   return null;
                      // },
                      decoration: inputDecoration(hint: "city"),
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
                      title: "Save next",
                      onTap: () {
                       
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();

                          Map<dynamic, dynamic> data = {
                            "Address1": addressLine1,
                            "Address2": addressLine2,
                            "PinCode": pinCode,
                            "State": pincodeDetails[0].state,
                            "City": pincodeDetails[0].state,
                            "SellerDetailId": widget.sellerDetailId
                          };
                          _savePickupDetails(data, context);
                        }
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _savePickupDetails(Map data, BuildContext context) async {
    SellRepository.pickupDetails(data).then((value) {
      if (value != null) {
        Navigator.pushReplacementNamed(context, RouterName.bankDetails,
            arguments: value.toString());
      }
    }).catchError((e) {
      showMessagess('Error');
    });
  }
}
