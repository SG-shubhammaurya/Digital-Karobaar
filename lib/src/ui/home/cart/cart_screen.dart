// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:digitalkarobaar/src/bloc/cart/cart_cubit.dart';
// import 'package:digitalkarobaar/src/bloc/cart/cart_state.dart';
// import 'package:digitalkarobaar/src/core/provider/cart_provider.dart';
// import 'package:digitalkarobaar/src/core/widget/common_button.dart';
// import 'package:digitalkarobaar/src/models/product_cart.dart';
// import 'package:digitalkarobaar/src/res/app_colors.dart';
// import 'package:digitalkarobaar/src/route/router_name.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:provider/provider.dart';

// class CartScreen extends StatefulWidget {
//   @override
//   _CartScreenState createState() => _CartScreenState();
// }

// class _CartScreenState extends State<CartScreen> {
//   CartCubit cartCubit;

//   @override
//   void initState() {
//     _getCartItems();

//     super.initState();
//   }

//   var deliveryCharge = 0;
//   _getCartItems() async {
//     //   getToCart().then((value) {
//     //     productCart = value;
//     //   });

//     cartCubit = await BlocProvider.of<CartCubit>(context).getCartItems(context);
//   }

//   List<Cart> cartData = [];
//   _setCart(CartDetailProvider cartItems, List<Cart> data) {
//     if (cartData.length == 0) {
//       cartData = data;
//       cartItems.addItems(data);
//     }
//   }

//   bool isshow = false;
//   bool showBottom = false;
//   var id;
//   @override
//   Widget build(BuildContext context) {
//     final cartItems = Provider.of<CartDetailProvider>(context);

//     return Scaffold(
//       appBar: AppBar(centerTitle: true, title: const Text('My Cart')),
//       body: BlocBuilder<CartCubit, CartState>(
//           cubit: cartCubit,
//           builder: (c, s) {
//             if (s is LoadingCart) {
//               return Center(child: CircularProgressIndicator());
//             }

//             if (s is CartItems) {
//               deliveryCharge = s.items.delivery;
//               _setCart(cartItems, s.items.data);

//               return buildCartItems();
//             }
//             if (s is CartItems) {
//               if (s.items.data.length == 0) {
//                 return Center(
//                   child: Text('No items in Cart'),
//                 );
//               }
//             }
//             if (s is SuccessCartRemove) {
//          cartItems. removeProduct(id);
//               _getCartItemsAgain(context);
//             }
//             if (s is ErrorStateCart) {
//               return Center(
//                 child: Text('No items in Cart'),
//               );
              
//             }
//             return Center(child: Text('Loading..'));
//           }),
//     );
//   }

//   Widget buildCartItems() {
//     return Consumer<CartDetailProvider>(builder: (context, cart, child) {
//       //  _setCart(cart, cart.cartItems);

//       return Stack(
//         fit: StackFit.loose,
//         children: [
//           ListView(
//            shrinkWrap: true,
//           primary: true,
//             children: List<Widget>.generate(cart.cartItems.length, (index) {
//               return Column(
//                 children: [
//                   ListTile(
//                       leading: CachedNetworkImage(
//                           width: 80,
//                           height: 80,
//                           imageUrl: cart.cartItems[index].image1,
//                           placeholder: (context, url) =>
//                               Center(child: CircularProgressIndicator()),
//                           errorWidget: (context, url, error) => Icon(
//                                 Icons.broken_image,
//                                 size: 20,
//                               )),
//                       title: Text(cart.cartItems[index].title,
//                           style: TextStyle(fontSize: 12)),
//                       subtitle:
//                           _setQuantity(cart.cartItems[index], cart, context),
//                       trailing: InkResponse(
//                         onTap: () {
//                         id=cart.cartItems[index];
                   
//                           _removeItems(cart.cartItems[index].id);
//                         },
//                         child: Padding(
//                           padding: EdgeInsets.only(right: 10.0),
//                           child: Icon(
//                             Icons.delete,
//                             size: 20,
//                             color: AppColors.primaryColor,
//                           ),
//                         ),
//                       )),
//                   Divider(color: Colors.black12, thickness: 2.0)
//                 ],
//               );
//             }).toList(),
//           ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: _showBottomNav(cart),
//           )
//         ],
//       );
//     });
//   }

//   _showBottomNav(CartDetailProvider cartItems) {
//     return cartItems != null
//         ? Visibility(
//             visible: cartItems.cart.length > 0, child: _checkOut(cartItems))
//         : SizedBox(height: 5, width: 5);
//   }

//   _setQuantity(
//       Cart cart, CartDetailProvider cartDetailProvider, BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(5.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           const SizedBox(height: 10),
//           Text('Price After Discount : \u20B9 ${cart.discount.toString()}',
//               style: TextStyle(
//                 fontSize: 12,
//               )),
//           const SizedBox(height: 10),
//           Text('MRP: \u20B9 ${cart.price.toString()}',
//               style: TextStyle(
//                 fontSize: 12,
//               )),
//           const SizedBox(height: 10),
//           Text('Margin : % ${cart.retail.toString()}',
//               style: TextStyle(
//                 fontSize: 12,
//               )),
//           const SizedBox(height: 10),
//           Text('GST : % ${cart.gst}',
//               style: TextStyle(
//                 fontSize: 12,
//               )),
//           const SizedBox(height: 10),
//           Text('Delivery Charge: \u20B9 $deliveryCharge',
//               style: TextStyle(
//                 fontSize: 12,
//               )),
//           const SizedBox(height: 10),
//           Text('Quantity:',
//               style: TextStyle(
//                 fontSize: 12,
//               )),
//           const SizedBox(height: 10),
//           Container(
//               height: 30,
//               width: 150,
//               alignment: Alignment.center,
//               decoration: BoxDecoration(
//                   shape: BoxShape.rectangle,
//                   borderRadius: BorderRadius.circular(15),
//                   color: Colors.grey[200]),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   InkWell(
//                       onTap: () {
//                         cartDetailProvider.updateProduct(
//                             cart, cart.quantity + 1, deliveryCharge);
//                       },
//                       child: Icon(
//                         Icons.add,
//                         size: 18,
//                         color: Colors.black,
//                       )),
//                   Text(
//                     '${cart.quantity}',
//                     style: TextStyle(color: Colors.black),
//                   ),
//                   cart.quantity ==  cart.initQuantity
//                       ? Icon(Icons.remove, size: 18, color: Colors.black38)
//                       : InkWell(
//                           onTap: () {
//                             final qtr = cart.quantity - 1;
//                             cartDetailProvider.updateProduct(
//                                 cart, qtr, deliveryCharge);
//                           },
//                           child:
//                               Icon(Icons.remove, size: 18, color: Colors.black))
//                 ],
//               )),
//         ],
//       ),
//     );
//   }

//   _checkOut(CartDetailProvider cart) {
//     return Container(
//       height: 94,
//       decoration: BoxDecoration(boxShadow: [
//         BoxShadow(
//           color: Colors.grey.withOpacity(0.1),
//           spreadRadius: 0.1,
//           blurRadius: 7,
//           offset: Offset(3, 0),
//         )
//       ]),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Expanded(
//             child: Center(
//               child: SizedBox(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Container(
//                       height: 40,
//                       width: 100,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(12),
//                           color: AppColors.primaryColor),
//                       child: Center(
//                         child: Text(
//                           '\u20B9 ${cart.calculateTotal(deliveryCharge)}',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: Center(
//               child: SizedBox(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     CommonButton(
//                       title: "CheckOut",
//                       buttonColor: AppColors.primaryColor,
//                       onTap: () {
//                         Navigator.pushNamed(context, RouterName.checkOutConfm,
//                             arguments: deliveryCharge);
//                       },
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   void _getCartItemsAgain(BuildContext context) async {
//     await BlocProvider.of<CartCubit>(context).getCartItems(context);
//   }

//   void _removeItems(int id) async {
//     await BlocProvider.of<CartCubit>(context).removeCartItems(id);
//   }
// }


import 'package:cached_network_image/cached_network_image.dart';
import 'package:digitalkarobaar/src/bloc/cart/cart_cubit.dart';
import 'package:digitalkarobaar/src/bloc/cart/cart_state.dart';
import 'package:digitalkarobaar/src/core/provider/cart_provider.dart';
import 'package:digitalkarobaar/src/core/widget/common_button.dart';
import 'package:digitalkarobaar/src/models/product_cart.dart';
import 'package:digitalkarobaar/src/res/app_colors.dart';
import 'package:digitalkarobaar/src/route/router_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  CartCubit cartCubit;

  @override
  void initState() {
    _getCartItems();

    super.initState();
  }

  var deliveryCharge = 0;
  _getCartItems() async {
    //   getToCart().then((value) {
    //     productCart = value;
    //   });

    cartCubit = await BlocProvider.of<CartCubit>(context).getCartItems(context);
  }

  List<Cart> cartData = [];
  _setCart(CartDetailProvider cartItems, List<Cart> data) {
    if (cartData.length == 0) {
      cartData = data;
      cartItems.addItems(data);
    }
  }

  bool isshow = false;
  bool showBottom = false;
  var id;
  @override
  Widget build(BuildContext context) {
    final cartItems = Provider.of<CartDetailProvider>(context);

    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('My Cart')),
      body: BlocBuilder<CartCubit, CartState>(
          cubit: cartCubit,
          builder: (c, s) {
            if (s is LoadingCart) {
              return Center(child: CircularProgressIndicator());
            }

            if (s is CartItems) {
              deliveryCharge = s.items.delivery;
              _setCart(cartItems, s.items.data);

              return buildCartItems();
            }
            if (s is CartItems) {
              if (s.items.data.length == 0) {
                return Center(
                  child: Text('No items in Cart'),
                );
              }
            }
            if (s is SuccessCartRemove) {
         cartItems. removeProduct(id);
              _getCartItemsAgain(context);
            }
            if (s is ErrorStateCart) {
              return Center(
                child: Text('No items in Cart'),
              );
              
            }
            return Center(child: Text('Loading..'));
          }),
    );
  }

  Widget buildCartItems() {
    return Consumer<CartDetailProvider>(builder: (context, cart, child) {
      //  _setCart(cart, cart.cartItems);

      return Stack(
        fit: StackFit.loose,
        children: [
          ListView(
           shrinkWrap: true,
          primary: true,
            children: List<Widget>.generate(cart.cartItems.length, (index) {
              return Column(
                children: [
                  ListTile(
                      leading: CachedNetworkImage(
                          width: 80,
                          height: 80,
                          imageUrl: cart.cartItems[index].image1,
                          placeholder: (context, url) =>
                              Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) => Icon(
                                Icons.broken_image,
                                size: 20,
                              )),
                      title: Text(cart.cartItems[index].title,
                          style: TextStyle(fontSize: 12)),
                      subtitle:
                          _setQuantity(cart.cartItems[index], cart, context),
                      trailing: InkResponse(
                        onTap: () {
                        id=cart.cartItems[index];
                   
                          _removeItems(cart.cartItems[index].id);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: Icon(
                            Icons.delete,
                            size: 20,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      )),
                  Divider(color: Colors.black12, thickness: 2.0)
                ],
              );
            }).toList(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: _showBottomNav(cart),
          )
        ],
      );
    });
  }

  _showBottomNav(CartDetailProvider cartItems) {
    return cartItems != null
        ? Visibility(
            visible: cartItems.cart.length > 0, child: _checkOut(cartItems))
        : SizedBox(height: 5, width: 5);
  }

  _setQuantity(
      Cart cart, CartDetailProvider cartDetailProvider, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(height: 10),
          Text('Price After Discount : \u20B9 ${cart.discount.toString()}',
              style: TextStyle(
                fontSize: 12,
              )),
          const SizedBox(height: 10),
          Text('MRP: \u20B9 ${cart.price.toString()}',
              style: TextStyle(
                fontSize: 12,
              )),
          const SizedBox(height: 10),
          Text('Margin : % ${cart.retail.toString()}',
              style: TextStyle(
                fontSize: 12,
              )),
          const SizedBox(height: 10),
          Text('GST : % ${cart.gst}',
              style: TextStyle(
                fontSize: 12,
              )),
          const SizedBox(height: 10),
          Text('Delivery Charge: \u20B9 $deliveryCharge',
              style: TextStyle(
                fontSize: 12,
              )),
          const SizedBox(height: 10),
          Text('Quantity:',
              style: TextStyle(
                fontSize: 12,
              )),
          const SizedBox(height: 10),
          Container(
              height: 30,
              width: 150,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey[200]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                      onTap: () {
                        cartDetailProvider.updateProduct(
                            cart, cart.quantity + 1, deliveryCharge);
                      },
                      child: Icon(
                        Icons.add,
                        size: 18,
                        color: Colors.black,
                      )),
                  Text(
                    '${cart.quantity}',
                    style: TextStyle(color: Colors.black),
                  ),
                  cart.quantity ==  cart.initQuantity
                      ? Icon(Icons.remove, size: 18, color: Colors.black38)
                      : InkWell(
                          onTap: () {
                            final qtr = cart.quantity - 1;
                            cartDetailProvider.updateProduct(
                                cart, qtr, deliveryCharge);
                          },
                          child:
                              Icon(Icons.remove, size: 18, color: Colors.black))
                ],
              )),
        ],
      ),
    );
  }

  _checkOut(CartDetailProvider cart) {
    return Container(
      height: 94,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 0.1,
          blurRadius: 7,
          offset: Offset(3, 0),
        )
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Center(
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.primaryColor),
                      child: Center(
                        child: Text(
                          '\u20B9 ${cart.calculateTotal(deliveryCharge)}',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CommonButton(
                      title: "CheckOut",
                      width: 120,
                      buttonColor: AppColors.primaryColor,
                      onTap: () {
                        Navigator.pushNamed(context, RouterName.checkOutConfm,
                            arguments: deliveryCharge);
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _getCartItemsAgain(BuildContext context) async {
    await BlocProvider.of<CartCubit>(context).getCartItems(context);
  }

  void _removeItems(int id) async {
    await BlocProvider.of<CartCubit>(context).removeCartItems(id);
  }
}
