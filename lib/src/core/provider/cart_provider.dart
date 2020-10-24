import 'package:digitalkarobaar/src/models/order_res.dart';
import 'package:digitalkarobaar/src/models/product_cart.dart';
import 'package:flutter/material.dart';

class CartDetailProvider extends ChangeNotifier {
//   List<Products> _cartItems = [];
//   num numOfQuantity=0;

//   int get noOfItemsInCart => cartItems.length;

//   num get priceInCart {
//     num price = 0;
//     List.generate(cartItems.length, (index) {
//       price = (cartItems[index].prize * cartItems.length);
//     });
//     return price;
//   }

//   List<Products> get cartItems => _cartItems;

//   setCardItems(Products cartModel) {

//     if(_cartItems.length==0){
//        _cartItems.add(cartModel);
//     notifyListeners();

//     }else{
//  _cartItems.forEach((element) {
//        if(cartModel.id != element.id){
//          _cartItems.add(cartModel);
//     notifyListeners();

//        }

//      });
//     }

//   }

//   removeItemsInCart(Products cartModel) {
//     _cartItems.remove(cartModel);
//      notifyListeners();
//   }

//   updateValueInCart(Products products, int cartItemvalue,bool shouldIncrease){
//      num newCartValue = shouldIncrease ?  cartItemvalue+1 : cartItemvalue-1;

//      if(newCartValue >= 0){
//        products.numOfItems = newCartValue ;
//        numOfQuantity = newCartValue;
//        notifyListeners();
//      }
//   }
  
//   Map<int, ProductCart> _items = {};
//   var checkOutTotal = 0.0;
//   Map<int, ProductCart> get cartItems {
//     return {..._items};
//   }

//   int get noOfItemsInCart {
//     return _items[0].data.length;
//   }

//   double totalAmount() {
//    var total = 0.0;
//     _items.forEach((key, cart) => total += cart.data[key].retail * cart.data[key].quantity);
//     checkOutTotal = total;
//     return total;
//   }

//   void setCardItems(
//       int productId, String title, double price, String image) {
//     if (_items.containsKey(productId)) {
//       _items.update(
//         productId,
//         (old) => ProductCart(
//           data: [
//             Cart(
//               quantity: old.data[productId].quantity + 1
//             )
//           ]
        
//         ),
//       );
//     } else {
//       _items.putIfAbsent(
//         productId,
//         () => ProductCart(
//           data: [
//             Cart(
//               quantity: 1
//             )
//           ]
        
//         ),
//       );
//     }
//     notifyListeners();
//   }

//   twentyPercentDiss(double amount) {
//     if (amount != null) {
//     final  amt = amount * 0.2;
//      final finalamount= amount-amt;

//        checkOutTotal =finalamount;

//      notifyListeners();
//     }
    
//   }

//   void removeItemsInCart(String productId) {
//     _items.remove(productId);
//     notifyListeners();
//   }

//   // void removeSingleItem(String productId) {
//   //   if (!_items.containsKey(productId)) return;
//   //   if (_items[productId].quantity > 1) {
//   //     _items.update(
//   //         productId,
//   //         (old) => Cart(
//   //               id: old.id,
//   //               title: old.title,
//   //               price: old.price,
//   //               image: old.image,
//   //               quantity: old.quantity - 1,
//   //             ));
//   //   } else {
//   //     _items.remove(productId);
//   //   }
//   //   notifyListeners();
//   // }

//   void clear() {
//     _items = {};
//     notifyListeners();
//   }
// }

// class Cart {
//   final String id;
//   final String title;
//   final int quantity;
//   final double price;
//   final String image;
//   Cart({this.id, this.title, this.price, this.quantity, this.image});

List<Cart> cart = [];
  double totalCartValue = 0.0;
var checkOutTotal = 0.0;

 OrderResponce _orderResponce;
 set orderResponce(OrderResponce orderResponce) =>_orderResponce= orderResponce;
OrderResponce get orderRes => _orderResponce;

  int get total => cart.length;
 var remaining=0.0;
  addItems(List<Cart> cartItems){
    cart=cartItems;
    notifyListeners();
  }
   int get noOfItemsInCart {
    return cart.length;
  }
   getCartItems(){
     return cart;
   }
  // void addProduct(product) {
  //   int index = cart.indexWhere((i) => i.id == product.id);
  //   print(index);
  //   if (index != -1)
  //     updateProduct(product, product.qty + 1);
  //   else {
  //     cart.add(product);
  //     calculateTotal();
  //     notifyListeners();
  //   }
  // }

  void removeProduct(product) {
    int index = cart.indexWhere((i) => i.id == product.id);
    cart[index].quantity = 1;
    cart.removeWhere((item) => item.id == product.id);
    calculateTotal();
    notifyListeners();
  }
    twentyPercentDiss(double amount) {
    if (amount != null) {
    final  amt = amount * 0.2;
     final finalamount= amount-amt;
      remaining = amt;
      checkOutTotal=0.0;
       checkOutTotal =finalamount;

     notifyListeners();
   // return checkOutTotal;
    }
    
  }

  void updateProduct(product, qty) {
    int index = cart.indexWhere((i) => i.id == product.id);
    cart[index].quantity= qty;
    if (cart[index].quantity == 0){
      removeProduct(product);

    }
     

    calculateTotal();
    notifyListeners();
  }

  // void clearCart() {
  //   cart.forEach((f) => f.qty = 1);
  //   cart = [];
  //   notifyListeners();
  // }

   double calculateTotal() {
    totalCartValue = 0.0;
    cart.forEach((f) {
      totalCartValue += f.retail *f.quantity;
      if(f.discount!=0 || f.discount!=null){
        totalCartValue = totalCartValue - f.discount;
      }
    });
    
     checkOutTotal = totalCartValue;
   //  notifyListeners();
    return totalCartValue;
  }
}