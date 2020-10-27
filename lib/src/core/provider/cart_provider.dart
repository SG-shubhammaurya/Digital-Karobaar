import 'package:digitalkarobaar/src/models/order_res.dart';
import 'package:digitalkarobaar/src/models/product_cart.dart';
import 'package:flutter/material.dart';

class CartDetailProvider extends ChangeNotifier {
  List<Cart> cart = [];
  double totalCartValue = 0.0;
  var checkOutTotal = 0.0;
  //var quantity=1;
  OrderResponce _orderResponce;
  set orderResponce(OrderResponce orderResponce) =>
      _orderResponce = orderResponce;
  OrderResponce get orderRes => _orderResponce;

  int get total => cart.length;
  var remaining = 0.0;
  addItems(List<Cart> cartItems) {
    cart = cartItems;
    notifyListeners();
  }

  int get noOfItemsInCart {
    return cart.length;
  }

  getCartItems() {
    return cart;
  }

  void removeProduct(product) {
    int index = cart.indexWhere((i) => i.id == product.id);
    cart[index].quantity = 1;
    cart.removeWhere((item) => item.id == product.id);
   
    notifyListeners();
  }

  twentyPercentDiss(double amount) {
    if (amount != null) {
      final amt = amount * 0.2;
      final finalamount = amount - amt;
      remaining = amt;
      // cart.forEach((items) {
        
      //   items.remaining = amt;
      // });
      checkOutTotal = 0.0;
      checkOutTotal = finalamount;

      notifyListeners();
      // return checkOutTotal;
    }
  }

  void updateProduct(product, qty) {
    int index = cart.indexWhere((i) => i.id == product.id);
    cart[index].quantity = qty;
    //quantity = qty;
    if (cart[index].quantity == 0) {
      removeProduct(product);
    }else{
       perItemsPrice(product);
    }
   calculateTotal();
    notifyListeners();
  }

  perItemsPrice(Cart cartItems) {
    int index = cart.indexWhere((i) => i.id == cartItems.id);
   if(index !=-1 ){
      cart[index].perItemsPrice = cart[index].quantity * cart[index].price;
      
    if (cart[index].discount != 0 || cart[index].discount != null) {
      cart[index].perItemsPrice =
          cart[index].perItemsPrice - cart[index].discount;
    }
   }
  }

  double calculateTotal() {
    totalCartValue = 0.0;
    cart.forEach((f) {
        f.remaining =0.0;
      totalCartValue += f.price * f.quantity;

      if (f.discount != 0 || f.discount != null && f.delivery != 0 || f.delivery != null) {
         final deliveryAdd = totalCartValue + f.delivery;
         totalCartValue = totalCartValue + deliveryAdd;
        totalCartValue = totalCartValue - f.discount;
       
      }
    });

    checkOutTotal = totalCartValue;
    notifyListeners();
    return totalCartValue;
  }
}