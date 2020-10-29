import 'package:cached_network_image/cached_network_image.dart';
import 'package:digitalkarobaar/src/bloc/cart/cart_cubit.dart';
import 'package:digitalkarobaar/src/bloc/cart/cart_state.dart';
import 'package:digitalkarobaar/src/core/provider/cart_provider.dart';
import 'package:digitalkarobaar/src/core/utils/constants/language_keys.dart';
import 'package:digitalkarobaar/src/core/widget/common_button.dart';
import 'package:digitalkarobaar/src/models/product_cart.dart';
import 'package:digitalkarobaar/src/res/app_colors.dart';
import 'package:digitalkarobaar/src/route/router_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:digitalkarobaar/src/core/utils/constants/common.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  CartCubit cartCubit;
  // OrderPlaceCubit orderPlaceCubit;
  @override
  void initState() {
    _getCartItems();

    // orderPlaceCubit = BlocProvider.of(context);
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

    return Scaffold(
      appBar: AppBar(centerTitle: true, 
      title: Text(LanguageKeys.myCart.translate(context))),
      body: BlocBuilder<CartCubit, CartState>(
          cubit: cartCubit,
          builder: (c, s) {
            if (s is LoadingCart) {
              return Center(child: CircularProgressIndicator());
            }

            if (s is CartItems) {
              cartItems.addItems(s.items.data);

              return Stack(
                fit: StackFit.loose,
                children: [
                  ListView(
                    shrinkWrap: true,
                    children:
                        List<Widget>.generate(s.items.data.length, (index) {
                      return Column(
                        children: [
                          ListTile(
                              leading: CachedNetworkImage(
                                  width: 80,
                                  height: 80,
                                  imageUrl: s.items.data[index].image1,
                                  placeholder: (context, url) => Center(
                                      child: CircularProgressIndicator()),
                                  errorWidget: (context, url, error) => Icon(
                                        Icons.broken_image,
                                        size: 20,
                                      )),
                              title: Text(s.items.data[index].title,style: 
                              TextStyle(fontSize: 12)),
                              subtitle: _setQuantity(
                                  s.items.data[index], cartItems, context),
                              trailing: InkResponse(
                                onTap: () {
                                  _removeItems(s.items.data[index].id);
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
                    child: _showBottomNav(cartItems),
                  )
                ],
              );
            }
            if (s is CartItems) {
              if (s.items.data.length == 0) {
                return Center(
                  child: Text('No items in Cart'),
                );
              }
            }
            if (s is SuccessCartRemove) {
              _getCartItemsAgain(context);
            }
            if (s is ErrorStateCart) {
              Text(s.message.toString());
            }
            return Center(child: Text('Loading..'));
          }),
    );
  }

  _showBottomNav(CartDetailProvider cartItems) {
    return cartItems != null
        ? Visibility(
            visible: cartItems.cart.length > 0, child: _checkOut(cartItems))
        : SizedBox(height: 5, width: 5);
  }

  _setQuantity(
      Cart list, CartDetailProvider cartDetailProvider, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [

         Text('Discunt : \u20B9 ${list.discount.toString()}',style: TextStyle(
           fontSize: 12,
         )),
         const SizedBox(height: 10),
         Text('Prize : \u20B9 ${list.price.toString()}',style: TextStyle(
           fontSize: 12,
         )),
           const SizedBox(height: 10),
         Text('Margin : % ${list.retail.toString()}',style: TextStyle(
           fontSize: 12,
         )),
           const SizedBox(height: 10),
         Text('Delivery Charge: \u20B9 ${list.delivery}',style: TextStyle(
           fontSize: 12,
         )),
           const SizedBox(height: 10),
           Text('Quantity:',style: TextStyle(
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
                        cartDetailProvider.updateProduct(list, list.quantity + 1);
                      },
                      child: Icon(
                        Icons.add,
                        size: 18,
                        color: Colors.black,
                      )),

                  Text('${list.quantity}',style: TextStyle(
                    color: Colors.black
                  ),),

                  list.quantity == 1
                      ? Icon(Icons.remove, size: 18, color: Colors.black38)
                      : InkWell(
                          onTap: () {
                            final qtr = list.quantity - 1;
                            cartDetailProvider.updateProduct(list, qtr);
                          },
                          child: Icon(Icons.remove, size: 18, color: Colors.black))
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
                          '\u20B9 ${cart.calculateTotal()}',
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
                      title:LanguageKeys.checkOut.translate(context),
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

  void _getCartItemsAgain(BuildContext context) async {
    await BlocProvider.of<CartCubit>(context).getCartItems(context);
  }

  void _removeItems(int id) async {
    await BlocProvider.of<CartCubit>(context).removeCartItems(id);
  }
}