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
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class CheckOut extends StatefulWidget {
  final deliveryCharge;
  CheckOut(this.deliveryCharge);
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
  Razorpay _razorpay;
  @override
  @override
  void initState() {
    super.initState();
  _getAddress();

    // selectedRadioTile = '';
  }

  List<OrderAddress> result = [];
  int addressId;
  _getAddress() async {
    orderPlaceCubit = await context.bloc<OrderPlaceCubit>().getOrderAddress();
  }

  String method;
  var remaining;
  var address = '';

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
    checkoutVaue = cartItems.checkOutTotal;
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
                          showMessagess("Ordered");
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
                              setSelectedRadioTile(val, 'COD');
                              checkoutVaue = cartItems.checkOutTotal;
                              remaining = cartItems.remaining;
                            },
                            activeColor: Colors.orange,
                          ),
                          RadioListTile(
                            value: '2',
                            groupValue: selectedRadioTile,
                            title: Text("20% Advance | 80% COD"),
                            //subtitle: Text("3% Extra Discount",style: TextStyle(color: Colors.orange),),
                            onChanged: (val) {
                              cartItems
                                  .twentyPercentDiss(cartItems.checkOutTotal);

                              setSelectedRadioTile(val, '20advance');
                              checkoutVaue = cartItems.checkOutTotal;
                              remaining = cartItems.remaining;
                            },
                            activeColor: Colors.orange,
                          ),
                          RadioListTile(
                            value: '3',
                            groupValue: selectedRadioTile,
                            title: Text("100% Advance"),
                            onChanged: (val) {
                              setSelectedRadioTile(val, 'online');
                              checkoutVaue = cartItems.checkOutTotal;
                              remaining = cartItems.remaining;
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
                height:350,
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
                                  // setState(() {
                                  //   kycSelectFile = uploadfile;
                                  // });
                                  if (uploadfile != null) {
                                    HomeReposiitory.uploadKyc(
                                        file: uploadfile,
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
                        const SizedBox(height: 5),

                        Text('Following documents you can upload'),
                          const SizedBox(height: 10),
                          SizedBox(width: 10),
                          Center(
                            child: Text("GST Certificate,DrugLicense, Shop EstaLicense, UdhyogAadhar,CAcheque, Trade,FSSAI, .",
                          style: TextStyle(color: Colors.black54),),
                          )
                        
                        
                        // Text('GST Certificate, Shop EstaLicense, UdhyogAadhar',
                        //     style: TextStyle(color: Colors.black54)),
                        // Text(
                        //   'CAcheque, Trade,FSSAI, DrugLicense.',
                        //   style: TextStyle(color: Colors.black54),
                        // ),

                        // FlatButton(onPressed: () {
                        //   Navigator.pushNamed(context, RouterName.shopkyc);
                        //  }, child: Text('Here'),

                        // )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                  height: 350,
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
                                  Text("GST",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      )),
                                  Text(cartItems.totalGst().toString())
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
                                  Text("Delivery Charge",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      )),
                                  Text('₹ ${widget.deliveryCharge.toString()}'
                                    
                                    )
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
                                  Text(cartItems.totalPiar().toString())
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
                                  Column(
                                    children: [
                                      Text('₹ ${checkoutVaue.toString()}'
                                       ),
                                      Text(
                                        'GST + Delivery Charge + amount',
                                        style: TextStyle(fontSize: 10),
                                      ),
                                    ],
                                  )
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
                                  Text("Address",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      )),
                                  Text(address.toString())
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
                                    List<Cart> cart = cartItems.cartItems;
                                    var list = cart
                                        .map((e) => {
                                              "ProductId": e.id,
                                              "OrderAddress": addressId,
                                              "Quantity": e.quantity,
                                              "Amount": e.perItemsPrice,
                                              "Paid_Amount": checkoutVaue,
                                              "method": method,
                                              "Remaining": remaining
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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            DropdownButtonFormField(
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
                  address = val.address1;
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
          ],
        ),
      ),
    );
  }

  void _updatePayment(String orderId) async {
    try {
      //payment
      var data = {
        "Order": orderIders,
        "Txn_Amount": checkoutVaue.toString(),
        "created_on": DateTime.now().toString(),
        "email": "a@gmail.com",
        "Orderid": orderId,
        "contact": "123478"
      };
      print(data.toString());
      context.bloc<OrderPlaceCubit>().confirmpayment(data);
    } catch (e) {}
  }

  void _handlePaymentSucess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        backgroundColor: AppColors.primaryColor,
        msg: "Success" + response.orderId);
        
    _updatePayment(response.orderId);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        backgroundColor: AppColors.primaryColor,
        msg: "Error" + response.code.toString() + "-" + response.message);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    _updatePayment(response.walletName);
    //response.
    Fluttertoast.showToast(
        backgroundColor: AppColors.primaryColor,
        msg: "External wallet" + response.walletName);
  }

  var orderIders;
  void openCheckout() async {
    var options = {
      'key': 'rzp_test_5TBXvETTxqtvUH',
      'amount': checkoutVaue * 100,
      'name': 'Digital Karobaar',
      'description': 'Test Payment',
      'prefill': {'contact': '', 'email': 'test@gmail.com'},
      // 'external': {
      //   'wallets': ['']
      // },
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      throw Exception(e);
    }
  }

  void _paymentForOrder() {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSucess);
    final cartItems = Provider.of<CartDetailProvider>(context);
    orderIders = cartItems.orderRes.id;
    openCheckout();
  }
}
