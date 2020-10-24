import 'package:digitalkarobaar/src/core/widget/common_button.dart';
import 'package:digitalkarobaar/src/repository/cart_repository.dart';
import 'package:digitalkarobaar/src/res/app_colors.dart';
import 'package:flutter/material.dart';

class AddressDelivery extends StatefulWidget {
  @override
  _AddressDeliveryState createState() => _AddressDeliveryState();
}

class _AddressDeliveryState extends State<AddressDelivery> {
  String _pincode;
  String _address1;
  String _address2;
  String _landmark;
  String _city;
  String _state;
  String _number;
  final GlobalKey<FormState> _formKeys = GlobalKey<FormState>();

  Widget _buildPinCode() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Pincode"),
      keyboardType: TextInputType.number,
      validator: (String value) {
        if (value.isEmpty) {
          return 'This is Required';
        }
        return null;
      },
      onSaved: (String value) {
        _pincode = value;
      },
    );
  }

  Widget _buildAddress1() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Address 1"),
      keyboardType: TextInputType.text,
      validator: (String value) {
        if (value.isEmpty) {
          return 'This is Required';
        }
        return null;
      },
      onSaved: (String value) {
        _address1 = value;
      },
    );
  }

  Widget _buildAddress2() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Address 2"),
      keyboardType: TextInputType.text,
      validator: (String value) {
        if (value.isEmpty) {
          return 'This is Required';
        }
        return null;
      },
      onSaved: (String value) {
        _address2 = value;
      },
    );
  }

  Widget _buildLandMark() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Landmark"),
      keyboardType: TextInputType.text,
      validator: (String value) {
        if (value.isEmpty) {
          return 'This is Required';
        }
        return null;
      },
      onSaved: (String value) {
        _landmark = value;
      },
    );
  }

  Widget _buildCity() {
    return TextFormField(
      decoration: InputDecoration(labelText: "City"),
      keyboardType: TextInputType.text,
      validator: (String value) {
        if (value.isEmpty) {
          return 'This is Required';
        }
        return null;
      },
      onSaved: (String value) {
        _city = value;
      },
    );
  }

  Widget _buildState() {
    return TextFormField(
      decoration: InputDecoration(labelText: "State"),
      keyboardType: TextInputType.text,
      validator: (String value) {
        if (value.isEmpty) {
          return 'This is Required';
        }
        return null;
      },
      onSaved: (String value) {
        _state = value;
      },
    );
  }

  Widget _buildAlternameNo() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Alternate Mobile Number"),
      keyboardType: TextInputType.number,
      validator: (String value) {
        if (value.isEmpty) {
          return 'This is Required';
        }
        return null;
      },
      onSaved: (String value) {
        _number = value;
      },
    );
  }

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: const Text('Add New Address')),
        body: ListView(children: [
          SizedBox(height: 20.0),
          Container(
            child: Form(
              key: _formKeys,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(children: [
                  _buildPinCode(),
                  _buildAddress1(),
                  _buildAddress2(),
                  _buildLandMark(),
                  _buildCity(),
                  _buildState(),
                  _buildAlternameNo(),
                  SizedBox(height: 50),
                  CommonButton(
                      title: "Save Address",
                      buttonColor: AppColors.primaryColor,
                      height: 40,
                      onTap: () {
                        if (_formKeys.currentState.validate()) {
                          _formKeys.currentState.save();
                          setState(() {
                            isLoading = true;
                          });

                          try {
                            CartRepository.deliveryAddress(
                                    _pincode,
                                    _address1,
                                    _address2,
                                    _landmark,
                                    _city,
                                    _state,
                                    _number)
                                .then((value) {});
                          } finally {
                            setState(() {
                              isLoading = false;
                            });
                          }
                        }
                      }),
                  isLoading ? CircularProgressIndicator() : SizedBox()
                ]),
              ),
            ),
          ),
        ]));
  }
}
