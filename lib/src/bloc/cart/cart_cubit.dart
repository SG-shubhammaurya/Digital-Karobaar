import 'package:digitalkarobaar/src/bloc/cart/cart_state.dart';
import 'package:digitalkarobaar/src/models/product_cart.dart';
import 'package:digitalkarobaar/src/repository/order_repository.dart';
import 'package:digitalkarobaar/src/res/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> with ConnectivityChecker {
  CartCubit(this.productOrderRepository) : super(null);
  ProductOrderRepository productOrderRepository;

  addToCart(String id) async {
    try {
      if (!await isConnected()) {
        emit(ErrorStateCart('Please Check Your NetWork Connection'));
        return;
      }
      emit(LoadingCart());
      final success = await productOrderRepository.addToCart(id);
      emit(SuccessStateCart(message: success));
    } catch (e) {
      emit(ErrorStateCart(e.toString()));
    }
  }

  getCartItems(BuildContext context) async {
    try {
      if (!await isConnected()) {
        emit(ErrorStateCart('Please Check Your NetWork Connection'));
        return;
      }
      emit(LoadingCart());
      ProductCart cartItems = await productOrderRepository.getToCart();
      emit(CartItems(cartItems));
    } catch (e) {
      emit(ErrorStateCart(e.toString()));
    }
  }

  removeCartItems(int id) async {
    try {
      if (!await isConnected()) {
        emit(ErrorStateCart('Please Check Your NetWork Connection'));
        return;
      }
      emit(LoadingCart());
      final success = await productOrderRepository.removeToCart(id.toString());
      emit(SuccessCartRemove(message: success));
    } catch (e) {
      emit(ErrorStateCart(e.toString()));
    }
  }
}
