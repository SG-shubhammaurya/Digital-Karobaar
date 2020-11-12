import 'package:digitalkarobaar/src/bloc/orderplace/order_place_cubit.dart';
import 'package:digitalkarobaar/src/core/provider/cart_provider.dart';
import 'package:digitalkarobaar/src/res/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPayment extends StatefulWidget {
  ProductPayment(this.totalAmount) :assert(totalAmount !=null) ;
  final totalAmount;
  @override
  _ProductPaymentState createState() => _ProductPaymentState();
}

class _ProductPaymentState extends State<ProductPayment> {
  Razorpay _razorpay;
  @override
  void initState() {
    super.initState();

    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSucess);
    openCheckout();
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_ELeMTlrU5ymqKt',
      'amount': widget.totalAmount *100,
      'name': 'Digital Karobaar',
      'description': 'Test Payment',
      'prefill': {'contact': '7579013416', 'email': 'test@gmail.com'},
      'external': {
        'wallets': ['paytm']
      },
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      throw Exception(e);
    }
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
  @override
  Widget build(BuildContext context) {
     final cartItems = Provider.of<CartDetailProvider>(context);
   //  orderIders = cartItems.orderRes.id;
  // print(cartItems.orderRes.id);
  
    return Scaffold(
      appBar: AppBar(title: Text("Amount Paid")
     
      ),
     
     
     
    );
  }

  void _updatePayment(String orderId) async {
    try {
      //payment
      var data = {
        "Order":orderIders,
        "Txn_Amount": widget.totalAmount.toString(),
        "created_on":  DateTime.now().toString(),
        "email": "a@gmail.com",
        "Orderid":orderId,
        "contact": "123478"
      };
       print(data.toString());
      context.bloc<OrderPlaceCubit>().confirmpayment(data);
    } catch (e) {}
  }
}
