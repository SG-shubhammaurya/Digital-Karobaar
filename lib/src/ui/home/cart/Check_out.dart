import 'dart:io';
import 'package:digitalkarobaar/src/bloc/orderplace/order_place_cubit.dart';
import 'package:digitalkarobaar/src/bloc/orderplace/order_place_state.dart';
import 'package:digitalkarobaar/src/core/provider/cart_provider.dart';
import 'package:digitalkarobaar/src/core/utils/constants/common.dart';
import 'package:digitalkarobaar/src/core/widget/common_button.dart';
import 'package:digitalkarobaar/src/core/widget/common_upload_file_alert.dart';
import 'package:digitalkarobaar/src/models/order_address.dart';
import 'package:digitalkarobaar/src/models/order_res.dart';
import 'package:digitalkarobaar/src/models/product_cart.dart';
import 'package:digitalkarobaar/src/repository/home_repository.dart';
import 'package:digitalkarobaar/src/res/app_colors.dart';
import 'package:digitalkarobaar/src/res/app_text_style.dart';
import 'package:digitalkarobaar/src/route/router_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class CheckOut extends StatefulWidget {
  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  // double _progressValue = 0;
  // int _progressPercentValue = 0;
  var documents = [];

  String selectedRadioTile;
  OrderPlaceCubit orderPlaceCubit;
  OrderResponce orderResponce;
  @override
  @override
  void initState() {
    super.initState();
    _getAddress();

    selectedRadioTile = '';
  }

  List<OrderAddress> result = [];
  int addressId;
  _getAddress() async {
    orderPlaceCubit = await context.bloc<OrderPlaceCubit>().getOrderAddress();
  }

  String method;

  setSelectedRadioTile(String val, String type) {
    setState(() {
      selectedRadioTile = val;
      method = type;
    });
  }

  File kycSelectFile;

  String radioItem = '';

  bool _value = false;
  bool selected = true;
  bool selected1 = true;
  bool selected2 = true;
  var checkoutVaue;
  @override
  Widget build(BuildContext context) {
    final cartItems = Provider.of<CartDetailProvider>(context);
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: const Text('Check Out')),
        body: ListView(children: [
          Column(
            children: [
              SizedBox(height: 10),
              Container(
                width: 400,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Column(
                      children: [
                        Text("Delivery Address",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            )),
                        SizedBox(height: 10),
                        Text(
                          "Looks like this is your first order.Please tell us where to deliver it for you",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.red),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RouterName.addressDeliver);
                            },
                            child: Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                ),
                                child: Text(
                                  "+ Add New Address",
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 12),
                                )))
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              BlocBuilder<OrderPlaceCubit, OrderPlaceState>(
                  cubit: orderPlaceCubit,
                  builder: (c, s) {
                    if (s is LoadingStateOrders) {
                      return Center(
                          child: CircularProgressIndicator(
                        backgroundColor: AppColors.primaryColor,
                      ));
                    }
                    if (s is GetOrderAddress) {
                      result = s.orderAdd;
                      return _buildAddress();
                    }
                    if (s is GetOrderResponse) {
                      if (s.orderSuccessRes.failed.length != 0) {
                        showMessagess("Order Failed");
                      } else {
                        if (selectedRadioTile == '2' ||
                            selectedRadioTile == '3') {
                          orderResponce = s.orderSuccessRes;

                          cartItems.orderResponce = s.orderSuccessRes;
                          _paymentForOrder();
                        } else {
                          showMessagess("Ordered");
                        }
                      }
                    }
                    return _buildAddress();
                  }),
              Container(
                  height: 250,
                  width: 400,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 10),
                              Text(
                                "Select Payment Option",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                children: [
                                  Text(
                                    "Please Choose one",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Text(
                                    "option",
                                    style: TextStyle(fontSize: 10),
                                  )
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 10),
                          RadioListTile(
                            value: '1',
                            groupValue: selectedRadioTile,
                            title: Text("Full Cash On Delivery"),
                            subtitle: Text(
                              "Remaning COD Limit ₹3500 out of ₹3500",
                              style: TextStyle(color: Colors.orange),
                            ),
                            onChanged: (val) {
                              setSelectedRadioTile(
                                  val, 'Full Cash On Delivery');
                              checkoutVaue = cartItems.checkOutTotal;
                            },
                            activeColor: Colors.orange,
                          ),
                          RadioListTile(
                            value: '2',
                            groupValue: selectedRadioTile,
                            title: Text("20% Advance | 80% COD"),
                            //subtitle: Text("3% Extra Discount",style: TextStyle(color: Colors.orange),),
                            onChanged: (val) {
                              setSelectedRadioTile(
                                  val, '20% Advance | 80% COD');
                              cartItems
                                  .twentyPercentDiss(cartItems.checkOutTotal);
                              checkoutVaue = cartItems.checkOutTotal;
                            },
                            activeColor: Colors.orange,
                          ),
                          RadioListTile(
                            value: '3',
                            groupValue: selectedRadioTile,
                            title: Text("100% Advance"),
                            subtitle: Text(
                              "3% Extra Discount",
                              style: TextStyle(color: Colors.orange),
                            ),
                            onChanged: (val) {
                              setSelectedRadioTile(val, '100% Advance');
                              checkoutVaue = cartItems.checkOutTotal;
                            },
                            activeColor: Colors.orange,
                          )
                        ],
                      ),
                    ),
                  )),
              SizedBox(height: 20),
              Container(
                width: 400,
                height: 250,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, left: 15),
                    child: Column(
                      children: [
                        Text("Please select one of the given option"),
                        SizedBox(
                          height: 20,
                        ),
                        Row(children: [
                          GestureDetector(
                            onTap: () {
                              CommonAlertBox.takeImageFromCamera(context,
                                  onUploadCallback: (uploadfile) {
                                if (uploadfile != null) {
                                  setState(() {
                                    kycSelectFile = uploadfile;
                                  });
                                  if (kycSelectFile != null) {
                                    HomeReposiitory.uploadKyc(
                                        file: kycSelectFile,
                                        onUploadProgressCallback: (s, t) {
                                          //_setUploadProgress(s, t);
                                        });
                                  }
                                }
                              });
                              // showAlertDialog(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blue)),
                              height: 25,
                              width: 160,
                              child: Text(
                                "I Don't have GST no",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              showAlertDialogBox(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blue)),
                              height: 25,
                              width: 160,
                              child: Column(
                                children: [
                                  Text(
                                    "I want GST invoice",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]),
                        SizedBox(height: 30),
                        Text(
                          "You must provide atlease one verification",
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "document or valid GST no.To sucessfully",
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "place the order",
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "This is only one time process",
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                  height: 200,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Column(
                        children: [
                          Text(
                            "Order Summery",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Total Seller",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      )),
                                  Text(cartItems.cart.length.toString())
                                ]),
                          ),
                          SizedBox(height: 15.0),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Total Pair",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(cartItems.cart[0].quantity.toString())
                                ]),
                          ),
                          SizedBox(height: 15.0),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Total Amount",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      )),
                                  Text(cartItems.checkOutTotal.toString())
                                ]),
                          ),
                          SizedBox(height: 20),
                          CommonButton(
                            title: "Confirm Order",
                            buttonColor: AppColors.primaryColor,
                            height: 35,
                            onTap: () async {
                              if (addressId != null) {
                                if (checkoutVaue != 0.0 || checkoutVaue != -1) {
                                  if (method != null) {
                                    List<Cart> cart = cartItems.getCartItems();
                                    var list = cart
                                        .map((e) => {
                                              "ProductId": e.id,
                                              "OrderAddress": addressId,
                                              "Quantity": e.quantity,
                                              "Amount": e.price,
                                              "Paid_Amount": e.perItemsPrice,

                                              "method": method,
                                              "Remaining": e.remaining
                                              //cartItems.remaining
                                            })
                                        .toList();
                                    print(list);
                                    context
                                        .bloc<OrderPlaceCubit>()
                                        .confirmOrder(list);
                                  } else {
                                    showMessagess("Select Payment Option");
                                  }
                                }
                              } else {
                                showMessagess("Select Address");
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ))
            ],
          ),
          BlocBuilder<OrderPlaceCubit, OrderPlaceState>(
              cubit: orderPlaceCubit,
              builder: (c, s) {
                if (s is LoadingStateOrders) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (s is SuccessStateOrder) {
                  showMessagess(s.message.toString());
                }

                if (s is ErrorStateOrder) {
                  showMessagess("Order Failed");
                }

                return SizedBox();
              }),
        ]));
  }

  showAlertDialogBox(BuildContext context) {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    AlertDialog alert1 = AlertDialog(
      title: Column(
        children: [
          Row(
            children: [
              Text("GST number"),
            ],
          ),
          SizedBox(height: 20),
          Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
              child: TextFormField()),
          SizedBox(height: 15),
          Text(
            "To get GST invoice and TAX benifit. Please provide your GST number above",
            style: TextStyle(color: Colors.blue, fontSize: 15),
          )
        ],
      ),
      actions: [okButton],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert1;
      },
    );
  }

  _buildAddress() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: DropdownButtonFormField(
          //  value: null,
          items: result.map((e) {
            return DropdownMenuItem<dynamic>(
                value: e,
                child: Text(
                  e.address1,
                  style: TextStyle(fontSize: 12),
                ));
          }).toList(),
          onChanged: (val) {
            setState(() {
              addressId = val.id;
            });
          },
          validator: (val) {
            if (val.isEmpty) {
              return "This is Required";
            }
            return null;
          },
          decoration: inputDecoration(hint: "Select Address"),
        ),
      ),
    );
  }

  _paymentForOrder() async {
    await Navigator.pushNamed(context, RouterName.paymentPage,
        arguments: checkoutVaue);
  }
}
