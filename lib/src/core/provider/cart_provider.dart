// import 'package:digitalkarobaar/src/core/utils/constants/common.dart';
// import 'package:digitalkarobaar/src/models/order_res.dart';
// import 'package:digitalkarobaar/src/models/product_cart.dart';
// import 'package:flutter/material.dart';

// class CartDetailProvider extends ChangeNotifier {
//   List<Cart> cart = [];
//   var totalCartValue ;
//   int  _checkOutTotal ;
//   //var quantity = 1;
//  // var deliveryCharge = 129;
//   OrderResponce _orderResponce;
//   set orderResponce(OrderResponce orderResponce) =>
//       _orderResponce = orderResponce;
//   OrderResponce get orderRes => _orderResponce;

//   int get total => cart.length;
//   int _remaining = 0;
//   addItems(List<Cart> cartItems) {
//     cart = cartItems;
//     notifyListeners();
//   }

//   int get noOfItemsInCart {
//     return cart.length;
//   }

//  List<Cart> get cartItems => cart;


//   void removeProduct(product) {
//     try {
//       int index = cart.indexWhere((i) => i.id == product.id);
//       cart[index].quantity = 1;
//       cart.removeWhere((item) => item.id == product.id);

//     notifyListeners();
//     } catch (e) {}
//   }
//   // void removeCartItem(int id) {
//   //   try {
//   //     cart.remove(id);
//   //     print(cart.length);
//   //    notifyListeners();
//   //   } catch (e) {}
//   // }
//   twentyPercentDiss(int amount) {
//     try {
//       if (amount != null) {
//        int amt = (amount * 0.2).toInt();
//        int remaining = amount - amt;
//         _remaining = 0;
//         _remaining = remaining;

//         _checkOutTotal = 0;
//         _checkOutTotal = amt;

//         notifyListeners();
       
//       }
//     } catch (e) {}
//   }

//   String _paymetOptionType = '';
//   String _method = '';
//   int get checkOutTotal => _checkOutTotal;
//  int get remaining => _remaining;

//   String get optionType => _paymetOptionType;
//   String get methodType => _method;

//   updateOptionType(String value, String method) {
//     if (value != _paymetOptionType || _method != null) {
//       _paymetOptionType = value;
//       _method = method;
//       notifyListeners();
//     }
//   }

//   void updateProduct(product, qty, int charge) {
//   //  if (qty >= product.minBuy) {
//      // showMessagess('minimum order is ${product.minBuy}');
//       //return;
//   //  }
//     try {
//       int index = cart.indexWhere((i) => i.id == product.id);
//       cart[index].quantity = qty;

//       //quantity = qty;
//       if (cart[index].quantity == 0) {
//         removeProduct(product);
//       } else {
//         perItemsPrice(product);
//       }
//       calculateTotal(charge);
//       notifyListeners();
//     } catch (e) {}
//   }

//   perItemsPrice(Cart cartItems) {
//     try {
//       int index = cart.indexWhere((i) => i.id == cartItems.id);
//       if (index != -1) {
//         cart[index].perItemsPrice = cart[index].quantity * cart[index].discount;
//       }
//     } catch (e) {}
//   }

//   dynamic totalPiar() {
//     var totalPair = 0;
//     cart.forEach((items) {
//       totalPair = totalPair + items.quantity;
//     });
//     return totalPair;
//   }

//   dynamic totalGst() {
//     var totalGst = 0.0;
//     cart.forEach((items) {
//        if (items.gst != null) {
//              items.perItemTotal = items.discount * items.quantity;
//           totalGst = totalGst + items.perItemTotal * items.gst*0.01;
//         }
     
//     });
//     return totalGst.toInt();
//   }

//   dynamic totalDeliveryCharges() {
//     int deliveryCharges = 0;
//     cart.forEach((items) {
//       deliveryCharges = deliveryCharges + items.delivery;
//     });
//     return deliveryCharges;
//   }

//  int calculateTotal(int delivery) {
//     try {
//     totalCartValue = 0.0;
//  _remaining = 0;
 
//    cart.forEach((item) {
//    var gst = 0.0;
    
//      item.perItemTotal = item.discount * item.quantity;
//       gst =  item.perItemTotal * item.gst*0.01;
//       item.perItemTotal =  item.perItemTotal + gst;

//     totalCartValue  =  totalCartValue+item.perItemTotal ;

//     });
//      totalCartValue =  totalCartValue +  delivery;
//          _checkOutTotal = totalCartValue.toInt();
// //  print( _checkOutTotal);
//       // cart.forEach((f) {
//       //    var gst = 0.0;
//       //   totalCartValue += f.discount * f.quantity;
//       //   if (f.gst != null) {
//       //     gst = totalCartValue * f.gst*0.01;

//       //     totalCartValue = totalCartValue + gst;
   
//       //   }
//       //   if (f.quantity == 1) {
//       //     perItemsPrice(f);
//       //   }
//       // });
//       //   totalCartValue = totalCartValue +  delivery;
//       // _checkOutTotal = totalCartValue.toInt();
      
//       // notifyListeners();
//       return  _checkOutTotal;
//     } catch (e) {}
//   }
// }


import 'package:digitalkarobaar/src/core/utils/constants/common.dart';
import 'package:digitalkarobaar/src/models/order_res.dart';
import 'package:digitalkarobaar/src/models/product_cart.dart';
import 'package:flutter/material.dart';

class CartDetailProvider extends ChangeNotifier {
  List<Cart> cart = [];
  var totalCartValue;
  int _checkOutTotal;
  //var quantity = 1;
  // var deliveryCharge = 129;
  OrderResponce _orderResponce;
  set orderResponce(OrderResponce orderResponce) =>
      _orderResponce = orderResponce;
  OrderResponce get orderRes => _orderResponce;

  int get total => cart.length;
  int _remaining = 0;
  addItems(List<Cart> cartItems) {
    cart = cartItems;
    notifyListeners();
  }

  int get noOfItemsInCart {
    return cart.length;
  }

  List<Cart> get cartItems => cart;

  void removeProduct(product) {
    try {
      int index = cart.indexWhere((i) => i.id == product.id);
      cart[index].quantity = 1;
      cart.removeWhere((item) => item.id == product.id);

      notifyListeners();
    } catch (e) {}
  }

  // void removeCartItem(int id) {
  //   try {
  //     cart.remove(id);
  //     print(cart.length);
  //    notifyListeners();
  //   } catch (e) {}
  // }
  twentyPercentDiss(int amount) {
    try {
      if (amount != null) {
        int amt = (amount * 0.2).toInt();
        int remaining = amount - amt;
        _remaining = 0;
        _remaining = remaining;

        _checkOutTotal = 0;
        _checkOutTotal = amt;

        notifyListeners();
      }
    } catch (e) {}
  }

  String _paymetOptionType = '';
  String _method = '';
  int get checkOutTotal => _checkOutTotal;
  int get remaining => _remaining;

  String get optionType => _paymetOptionType;
  String get methodType => _method;

  updateOptionType(String value, String method) {
    if (value != _paymetOptionType || _method != null) {
      _paymetOptionType = value;
      _method = method;
      notifyListeners();
    }
  }

  void updateProduct(product, qty, int charge) {
    //  if (qty >= product.minBuy) {
    // showMessagess('minimum order is ${product.minBuy}');
    //return;
    //  }
    try {
      int index = cart.indexWhere((i) => i.id == product.id);
      cart[index].quantity = qty;

      //quantity = qty;
      if (cart[index].quantity == 0) {
        removeProduct(product);
      } else {
        perItemsPrice(product);
      }
      calculateTotal(charge);
      notifyListeners();
    } catch (e) {}
  }

  perItemsPrice(Cart cartItems) {
    try {
      int index = cart.indexWhere((i) => i.id == cartItems.id);
      if (index != -1) {
        cart[index].perItemsPrice = cart[index].quantity * cart[index].discount;
      }
    } catch (e) {}
  }

  dynamic totalPiar() {
    var totalPair = 0;
    cart.forEach((items) {
      totalPair = totalPair + items.quantity;
    });
    return totalPair;
  }

  dynamic totalGst() {
    try {
      var totalGst = 0.0;
      cart.forEach((items) {
        if (items.gst != null) {
          items.perItemTotal = items.discount * items.quantity;
          totalGst = totalGst + items.perItemTotal * items.gst * 0.01;
        }
      });
      return totalGst.toInt();
    } catch (e) {
      showMessagess(e.toString());
    }
  }

  dynamic totalDeliveryCharges() {
    int deliveryCharges = 0;
    cart.forEach((items) {
      deliveryCharges = deliveryCharges + items.delivery;
    });
    return deliveryCharges;
  }

  int calculateTotal(int delivery) {
    try {
      totalCartValue = 0.0;
      _remaining = 0;

      cart.forEach((item) {
        var gst = 0.0;

        item.perItemTotal = item.discount * item.quantity;
        gst = item.perItemTotal * item.gst * 0.01;
        item.perItemTotal = item.perItemTotal + gst;

        totalCartValue = totalCartValue + item.perItemTotal;
      });
      totalCartValue = totalCartValue + delivery;
      _checkOutTotal = totalCartValue.toInt();
      return _checkOutTotal;
    } catch (e) {
      showMessagess(e.toString());
    }
  }
}


