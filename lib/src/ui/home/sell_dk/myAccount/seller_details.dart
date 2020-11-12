import 'package:digitalkarobaar/src/bloc/seller/seller_details_cubit.dart';
import 'package:digitalkarobaar/src/bloc/seller/seller_state.dart';
import 'package:digitalkarobaar/src/core/utils/constants/common.dart';
import 'package:digitalkarobaar/src/core/utils/util.dart';
import 'package:digitalkarobaar/src/core/widget/common_button.dart';
import 'package:digitalkarobaar/src/models/states.dart';
import 'package:digitalkarobaar/src/res/app_colors.dart';
import 'package:digitalkarobaar/src/res/app_text_style.dart';
import 'package:digitalkarobaar/src/route/router_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SellerDetails extends StatelessWidget {
  SellerDetails({this.isFormUpdate});
  bool isFormUpdate = false;
  var companyName;
  var representativeName;
  var emailId;
  var phoneNo;
  var selectProfileType;
  var addressLine1;
  var addressLine2;
  var pincode;
  var state;
  var dispatch;
  var city;
  List profileType = ['Footwear Wholesaler', 'Footwear Manufacturer'];
  List citiesRow = <dynamic>["select"];
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ValueNotifier<String> dropdownValue;

  List<States> states = [];
  @override
  Widget build(BuildContext context) {
    final sellCubit = BlocProvider.of<SellerCubit>(context);
    sellCubit.getAllStates();
    return Scaffold(
      appBar: AppBar(
        title: isFormUpdate ? Text('Update Account') : Text("Seller Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            const SizedBox(height: 10),
            const Text("Company Name"),
            const SizedBox(height: 10),
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                      validator: (val) {
                        if (val.length == 0) {
                          return "This is Required";
                        }
                      },
                      onSaved: (name) {
                        companyName = name;
                      },
                      keyboardType: TextInputType.text,
                      decoration: inputDecoration(hint: "Company Name")),
                  SizedBox(height: 20),
                  const Text("Representative Name"),
                  const SizedBox(height: 10),
                  TextFormField(
                      validator: (val) {
                        if (val.isEmpty) {
                          return "This is Required";
                        }
                      },
                      onSaved: (repname) {
                        representativeName = repname;
                      },
                      onChanged: (val) {},
                      keyboardType: TextInputType.text,
                      decoration:
                          inputDecoration(hint: "Your Representative Name")),
                  const SizedBox(height: 10),
                  const Text("Email Id"),
                  const SizedBox(height: 10),
                  TextFormField(
                      validator: (val) => Util.validateEmail(val),
                      onSaved: (emailid) {
                        emailId = emailid;
                      },
                      onChanged: (val) {},
                      keyboardType: TextInputType.emailAddress,
                      decoration: inputDecoration(hint: "Enter your email")),
                  const SizedBox(height: 10),
                  const Text("Phone No"),
                  const SizedBox(height: 10),
                  TextFormField(
                      maxLength: 10,
                      validator: (val) => Util.validateMobile(val),
                      onSaved: (mobileNo) {
                        phoneNo = mobileNo;
                      },
                      onChanged: (val) {},
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.phone,
                      decoration: inputDecoration(hint: "Phone No")),
                  const SizedBox(height: 10),
                  const Text("Billing Address"),
                  const SizedBox(height: 10),
                  const Text("Address Line1"),
                  const SizedBox(height: 10),
                  TextFormField(
                      validator: (val) {
                        if (val.isEmpty) {
                          return "This is Required";
                        }
                      },
                      onSaved: (add1) {
                        addressLine1 = add1;
                      },
                      onChanged: (val) {},
                      decoration: inputDecoration(hint: "Your Address Line1")),
                  const SizedBox(height: 10),
                  const Text("Address Line2"),
                  const SizedBox(height: 10),
                  TextFormField(
                      validator: (val) {
                        if (val.isEmpty) {
                          return "This is Required";
                        }
                        return null;
                      },
                      onSaved: (add2) {
                        addressLine2 = add2;
                      },
                      onChanged: (val) {},
                      textInputAction: TextInputAction.next,
                      decoration: inputDecoration(hint: "Your Address Line2")),
                  SizedBox(height: 10),
                  Text("Dispatch Day"),
                  SizedBox(height: 10),
                  TextFormField(
                      validator: (val) {
                        if (val.isEmpty) {
                          return "This is Required";
                        }
                      },
                      keyboardType: TextInputType.number,
                      onSaved: (dispa) {
                        dispatch = dispa;
                      },
                      onChanged: (val) {},
                      decoration: inputDecoration(hint: "Dispatch in day")),
                  const SizedBox(height: 10),
                  Text("Pincode"),
                  SizedBox(height: 10),
                  TextFormField(
                      validator: (val) {
                        if (val.isEmpty) {
                          return "This is Required";
                        } else if (val.length < 4) {
                          return "Enter Valid PinCode";
                        }
                      },
                      onSaved: (pinCode) {
                        pincode = pinCode;
                      },
                      onChanged: (val) {},
                      textInputAction: TextInputAction.next,
                      decoration:
                          inputDecoration(hint: "Your Billing Pincode")),
                  const SizedBox(height: 10),
                  const Text("Select Profile Type"),
                  const SizedBox(height: 10),
                  DropdownButtonFormField<String>(
                    value: null,
                    items: profileType.map((e) {
                      return DropdownMenuItem<String>(
                          value: e.toString(),
                          child: Text(
                            e.toString(),
                            style: TextStyle(fontSize: 14),
                          ));
                    }).toList(),
                    onChanged: (val) {
                      selectProfileType = val;
                    },
                    onSaved: (val) {
                      print(val);
                    },
                    validator: (val) {
                      if (val.isEmpty) {
                        return "This is Required";
                      }
                      return null;
                    },
                    decoration: inputDecoration(hint: "Profile Type"),
                  ),
                  const SizedBox(height: 10),
                  const Text("State"),
                  const SizedBox(height: 10),
                  BlocBuilder<SellerCubit, SellerDetail>(
                      cubit: sellCubit,
                      builder: (_, state) {
                        if (state is SellerDetailLoadedState) {
                          states = state.result;
                          return _buildState(state.result, sellCubit);
                        } else {
                          return _buildState(states, sellCubit);
                        }
                        //return _buildState(states, sellCubit);
                      }),
                  const SizedBox(height: 10),
                  const SizedBox(height: 10),
                  const Text("City"),
                  const SizedBox(height: 10),
                  BlocBuilder<SellerCubit, SellerDetail>(
                      cubit: sellCubit,
                      builder: (context, state) {
                        if (state is Success) {
                          _navigateToDoc(context, state.id);
                        }
                        if (state is LoadedCities) {
                          citiesRow = state.cities;
                          return _buildCities(state.cities);
                        }
                        if (state is SellerDetailErrorState) {
                          showMessagess('Error');
                        }

                        return _buildCities(citiesRow);
                      }),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        isFormUpdate
                            ? CommonButton(
                                buttonColor: AppColors.primaryColor,
                                titleColor: Colors.white,
                                title: "Update Accouunt",
                                onTap: () {
                                  if (formKey.currentState.validate()) {
                                    formKey.currentState.save();
                                    Map<dynamic, dynamic> data = 
                                    {
                                      "Company_Name": companyName,
                                      "Name": representativeName,
                                      "Email": emailId,
                                      "Phone": phoneNo,
                                      "Profile": selectProfileType.toString(),
                                      "Address1": addressLine1,
                                      "Address2": addressLine2,
                                        "Dispatch": dispatch,
                                      "PinCode": pincode.toString(),
                                      "State": state,
                                      "City": dropdownValue.value.toString(),
                                    };

                                    sellCubit.updateDetails(data);
                                  }
                                },
                              )
                            : CommonButton(
                                buttonColor: AppColors.primaryColor,
                                titleColor: Colors.white,
                                title: "Save next",
                                onTap: () {
                                 if (formKey.currentState.validate()) {
                                    formKey.currentState.save();
                                   
                                    Map<dynamic, dynamic> data = {
                                      "Company_Name": companyName,
                                      "Name": representativeName,
                                      "Email": emailId,
                                      "Phone": phoneNo,
                                      "Profile": selectProfileType.toString(),
                                      "Address1": addressLine1,
                                      "Address2": addressLine2,
                                      "PinCode": pincode.toString(),
                                      "State": state,
                                      "Dispatch": dispatch,
                                      "City": dropdownValue.value.toString(),
                                    };

                                    sellCubit.fillDetails(data);
                                  }
                               },
                              ),
                        BlocBuilder<SellerCubit, SellerDetail>(
                            builder: (_, state) {
                          if (state is SellerDetailLoadingSate) {
                            return Center(
                              child: CircularProgressIndicator(
                                backgroundColor: AppColors.primaryColor,
                              ),
                            );
                          }
                          return SizedBox();
                        })
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildState(List<States> result, SellerCubit sellCubit) {
    return result != null
        ? DropdownButtonFormField(
            value: null,
            items: result.map((e) {
              return DropdownMenuItem<String>(
                  value: e.name,
                  child: Text(
                    e.name,
                    style: TextStyle(fontSize: 14),
                  ));
            }).toList(),
            onChanged: (val) {
              state = val;
              sellCubit.getAllCities(val);
            },
            validator: (val) {
              if (val.isEmpty) {
                return "This is Required";
              }
              return null;
            },
            decoration: inputDecoration(hint: "state"),
          )
        : SizedBox();
  }

  _buildCities(List<dynamic> result) {
    dropdownValue = ValueNotifier<String>(result[0]);

    return ValueListenableBuilder<String>(
        valueListenable: dropdownValue,
        builder: (context, value, child) {
          return result != null
              ? DropdownButtonFormField<dynamic>(
                  value: dropdownValue.value,
                  items: result.map((e) {
                    return DropdownMenuItem<dynamic>(
                        value: e.toString(),
                        child: Text(
                          e,
                          style: TextStyle(fontSize: 14),
                        ));
                  }).toList(),
                  onChanged: (val) {
                    dropdownValue.value = val;
                    city = val;
                  },
                  validator: (val) {
                    if (val.isEmpty) {
                      return "This is Required";
                    }
                  },
                  decoration: inputDecoration(hint: ""),
                )
              : SizedBox();
        });
  }

  void _navigateToDoc(BuildContext context, id) async {
    if (id != null) {
      if (!isFormUpdate) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pushReplacementNamed(context, RouterName.documents,
              arguments: id);
        });
      }
    }
  }
}
