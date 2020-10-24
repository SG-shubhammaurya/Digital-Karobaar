import 'package:cached_network_image/cached_network_image.dart';
import 'package:digitalkarobaar/src/bloc/cart/cart_cubit.dart';
import 'package:digitalkarobaar/src/bloc/cart/cart_state.dart';
import 'package:digitalkarobaar/src/bloc/orderplace/order_place_cubit.dart';
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
  OrderPlaceCubit orderPlaceCubit;
  @override
  void initState() {
    _getCartItems();
  
    orderPlaceCubit = BlocProvider.of(context);
    super.initState();
  }

  _getCartItems() async {
    cartCubit = await BlocProvider.of<CartCubit>(context).getCartItems(context);
  }

  bool isshow = false;
  bool showBottom = false;
  @override
  Widget build(BuildContext context) {
    final cartItems = Provider.of<CartDetailProvider>(context);
    // return Consumer<CartDetailProvider>(
    //     builder: (BuildContext context, cart, child) {
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: const Text('My Cart')),
        body: BlocBuilder<CartCubit, CartState>(
            cubit: cartCubit,
            builder: (c, s) {
              if (s is LoadingCart) {
                return Center(child: CircularProgressIndicator());
              }
              if (s is CartItems) {
                if (s.items.data.length == 0) {
                  return Center(
                    child: Text('No items in Cart'),
                  );
                }
              }
              if (s is CartItems) {
                cartItems.addItems(s.items.data);
               showBottom = true;
                return ListView(
                  shrinkWrap: true,
                  children: List<Widget>.generate(s.items.data.length, (index) {
                  
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),

                              spreadRadius: 0.1,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ]),
                      child: ListTile(
                          leading: CachedNetworkImage(
                            width: 60,
                            height: 50,
                            imageUrl: s.items.data[index].image1,
                            placeholder: (context, url) =>
                                Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.broken_image),
                          ),
                          title: Text(s.items.data[index].title),
                          subtitle:
                              _setQuantity(s.items.data[index], cartItems),
                          //   Text(
                          // '${cartDetailProvider.cartItems.values.toList()[index].quantity}'),
                          trailing: InkResponse(
                            onTap: () {
                              _removeItems(s.items.data[index].id);
                            },
                            child: Padding(
                              padding: EdgeInsets.only(right: 10.0),
                              child: Icon(
                                Icons.remove_circle,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          )),
                    );
                  }).toList(),
                );
              }
              if (s is SuccessCartRemove) {
                _getCartItemsAgain();
              }

              return Container();
            }),
        bottomNavigationBar:
            Consumer<CartDetailProvider>(builder: (c, p, child) {
          return  showBottom ?  _showBottomNav(p) : SizedBox(height: 5, width: 5);
        }));
    // }
    //);
  }

  _showBottomNav(CartDetailProvider cartItems) {
    return cartItems != null
        ? Visibility(
            visible: cartItems.cart.length > 0, child: _checkOut(cartItems))
        : SizedBox(height: 5, width: 5);
  }

  _setQuantity(Cart list, CartDetailProvider cartDetailProvider) {
    return Container(
        height: 32,
        width: MediaQuery.of(context).size.width * 0.30,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey[200]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Text(''),

            InkWell(
                onTap: () {
                  cartDetailProvider.updateProduct(list, list.quantity + 1);
                },
                child: Icon(
                  Icons.add,
                  color: Colors.black,
                )),

            Text('${list.quantity}'),

            InkWell(
                onTap: () {
                  cartDetailProvider.updateProduct(list, list.quantity - 1);
                  if (list.quantity == 0) {
                    _removeItems(list.id);
                  }
                },
                child: Icon(Icons.remove, color: Colors.black))
          ],
        ));
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
                          cart.calculateTotal().toString(),
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
                      title: "checkOut",
                      buttonColor: AppColors.primaryColor,
                      onTap: () {
                        Navigator.pushNamed(context, RouterName.checkOutConfm);
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

  void _getCartItemsAgain() async {
    ///await BlocProvider.of<CartCubit>(context).getCartItems();
  }

  void _removeItems(int id) async {
    await BlocProvider.of<CartCubit>(context).removeCartItems(id);
  }
}
