import 'dart:io';
import 'package:digitalkarobaar/src/bloc/orderplace/order_place_cubit.dart';
import 'package:digitalkarobaar/src/bloc/orderplace/order_place_state.dart';
import 'package:digitalkarobaar/src/core/provider/cart_provider.dart';
import 'package:digitalkarobaar/src/core/utils/constants/common.dart';
import 'package:digitalkarobaar/src/core/utils/util.dart';
import 'package:digitalkarobaar/src/core/widget/common_button.dart';
import 'package:digitalkarobaar/src/core/widget/common_upload_file_alert.dart';
import 'package:digitalkarobaar/src/models/order_address.dart';
import 'package:digitalkarobaar/src/models/order_res.dart';
import 'package:digitalkarobaar/src/models/product_cart.dart';
import 'package:digitalkarobaar/src/payment/products_payment.dart';
import 'package:digitalkarobaar/src/repository/home_repository.dart';
import 'package:digitalkarobaar/src/res/app_colors.dart';
import 'package:digitalkarobaar/src/res/app_text_style.dart';
import 'package:digitalkarobaar/src/route/router_name.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class CheckOut extends StatefulWidget {
  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  double _progressValue = 0;
  int _progressPercentValue = 0;
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

    // ProductOrderRepository.getdeliveryAddress();
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
    final cartItems = context.watch<
        CartDetailProvider>(); //Provider.of<CartDetailProvider>(context);
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
                          print(orderResponce.id.toString());
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
                              print("Radio Tile pressed $val");
                              setSelectedRadioTile(
                                  val, 'Full Cash On Delivery');
                            },
                            activeColor: Colors.orange,
                          ),
                          RadioListTile(
                            value: '2',
                            groupValue: selectedRadioTile,
                            title: Text("20% Advance | 80% COD"),
                            //subtitle: Text("3% Extra Discount",style: TextStyle(color: Colors.orange),),
                            onChanged: (val) {
                              print("Radio Tile pressed $val");
                              setSelectedRadioTile(
                                  val, '20% Advance | 80% COD');
                              cartItems.twentyPercentDiss(
                                  cartItems.calculateTotal());
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
                              print("Radio Tile pressed $val");
                              setSelectedRadioTile(val, '100% Advance');
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
                                fontWeight: FontWeight.bold, fontSize: 20),
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
                                List<Cart> cart = cartItems.getCartItems();
                                var list = cart
                                    .map((e) => {
                                          "ProductId": e.id,
                                          "OrderAddress": addressId,
                                          "Quantity": e.quantity,
                                          "Amount": e.retail,
                                          "Paid_Amount":
                                              cartItems.checkOutTotal,
                                          "method": method,
                                          "Remaining": cartItems.remaining
                                        })
                                    .toList();
                                print(list.toString());
                                context
                                    .bloc<OrderPlaceCubit>()
                                    .confirmOrder(list);
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
                if (s is SuccessStateOrder) {
                  showMessagess(s.message.toString());
                }
                if (s is LoadingStateOrder) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (s is ErrorStateOrder) {
                  showMessagess("Order Failed");
                }

                return SizedBox();
              }),
        ]));
  }

  // showAlertDialog(BuildContext context) {
  //   Widget onCancel = FlatButton(
  //     child: Text("Cancel"),
  //     onPressed: () {
  //       Navigator.pop(context);
  //     },
  //   );
  //   AlertDialog alert = AlertDialog(
  //     title: Column(
  //       children: [
  //         Text(
  //           'Upload one of the given',
  //           style: TextStyle(fontSize: 18),
  //         ),
  //         SizedBox(height: 10),
  //         Row(
  //           children: [
  //             Text(
  //               "Visiting card",
  //               style: TextStyle(color: Colors.blue, fontSize: 15),
  //             ),
  //           ],
  //         ),
  //         Row(
  //           children: [
  //             Text(
  //               "Shop photo",
  //               style: TextStyle(color: Colors.blue, fontSize: 15),
  //             ),
  //           ],
  //         ),
  //         Row(
  //           children: [
  //             Text(
  //               "Bill no",
  //               style: TextStyle(color: Colors.blue, fontSize: 15),
  //             ),
  //           ],
  //         ),
  //       ],
  //     ),
  //     content: ListView(
  //       shrinkWrap: true,
  //       children: [
  //         InkWell(
  //           onTap: () {
  //             _uploadKyc(context);
  //             Navigator.pop(context);
  //           },
  //           child: Text("Gallery",
  //               style: TextStyle(fontSize: 15, color: Colors.black54)),
  //         ),
  //         SizedBox(height: 10),
  //         InkWell(
  //             onTap: () {
  //               _fromCamera(context);
  //               Navigator.pop(context);
  //             },
  //             child: Text("Camera",
  //                 style: TextStyle(fontSize: 15, color: Colors.black54)))
  //       ],
  //     ),
  //     actions: [onCancel],
  //   );
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return alert;
  //     },
  //   );
  // }

  // void _uploadKyc(BuildContext context) async {
  //   try {
  //     File fileKyc = await FilePicker.getFile();
  //     _setUploadProgress(0, 0);

  //   } catch (e) {
  //     Fluttertoast.showToast(
  //         textColor: Colors.red, msg: e.toString() ?? 'Failed');
  //     Navigator.pop(context);
  //   }
  // }

  // _fromCamera(BuildContext context) async {
  //   try {
  //     final pickedFile =
  //         await ImagePicker().getImage(source: ImageSource.camera);

  //     if (pickedFile != null) {
  //       File imageFile = File(pickedFile.path);
  //       HomeReposiitory.uploadKyc(
  //           file: imageFile, onUploadProgressCallback: (s, t) {});
  //     }
  //   } catch (e) {}
  // }

  void _setUploadProgress(int sentBytes, int totalBytes) {
    double __progressValue =
        Util.remap(sentBytes.toDouble(), 0, totalBytes.toDouble(), 0, 1);

    __progressValue = double.parse(__progressValue.toStringAsFixed(2));

    if (__progressValue != _progressValue)
      setState(() {
        _progressValue = __progressValue;
        _progressPercentValue = (_progressValue * 100.0).toInt();

        //  showProgress(context);
      });
  }

  // showProgress(BuildContext context) {
  //   Widget onFinih = FlatButton(
  //     child: Text("Ok"),
  //     onPressed: () {
  //       Navigator.pop(context);
  //     },
  //   );
  //   AlertDialog alert = AlertDialog(
  //     title: Text('Uploading..'),
  //     content: ListView(
  //       shrinkWrap: true,
  //       children: [
  //         Text(
  //           '$_progressPercentValue %',
  //           style: Theme.of(context).textTheme.bodyText1,
  //         ),
  //         SizedBox(height: 10),
  //         Container(
  //             padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
  //             child: LinearProgressIndicator(value: _progressValue)),
  //       ],
  //     ),
  //     actions: [onFinih],
  //   );
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return alert;
  //     },
  //   );
  // }

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

    // Navigator.pushNamed(context, RouterName.paymentPage);
    // if (selectedRadioTile == '2' || selectedRadioTile == '3') {
    //   //payment
    //   var data = {
    //     "Order": orderResponce.id,
    //     "Txn_Amount": "200",
    //     "created_on": TimeOfDay.now(),
    //     "email": "a@gmail.com",
    //     "Orderid": "2",
    //     "contact": "123478"
    //   };
    //   context.bloc<OrderPlaceCubit>().confirmpayment(data);
    //   Navigator.pushNamed(context, RouterName.paymentPage);
    // }
  }
}
