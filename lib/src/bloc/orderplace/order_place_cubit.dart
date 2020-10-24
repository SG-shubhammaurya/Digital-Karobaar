import 'package:digitalkarobaar/src/repository/order_repository.dart';
import 'package:digitalkarobaar/src/res/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'order_place_state.dart';

class OrderPlaceCubit extends Cubit<OrderPlaceState> with ConnectivityChecker {
  OrderPlaceCubit(this.productOrderRepository) : super(OrderInitialSate());
  ProductOrderRepository productOrderRepository;

  confirmOrder(List<Map<String, dynamic>> map) async {
    try {
      if (!await isConnected()) {
        emit(ErrorStateOrder('Please Check Your NetWork Connection'));
        return;
      }
      emit(LoadingStateOrder());
     final result =  await productOrderRepository.confirmplaceOrder(map);
     emit(GetOrderResponse(result));

    } catch (e) {
       emit(ErrorStateOrder(e.toString()));
    }
  }
  confirmpayment(Map<String ,dynamic> data) async {
    try {
      if (!await isConnected()) {
        emit(ErrorStateOrder('Please Check Your NetWork Connection'));
        return;
      }
      emit(LoadingStateOrder());
     final result =  await productOrderRepository.confirmpayment(data);
     emit(SuccessStateOrder(result));

    } catch (e) {
       emit(ErrorStateOrder(e.toString()));
    }
  }
 
   getOrderAddress() async {
    try {
      if (!await isConnected()) {
        emit(ErrorStateOrder('Please Check Your NetWork Connection'));
        return;
      }
      emit(LoadingStateOrder());
     final result =  await productOrderRepository.getdeliveryAddress();
    emit(GetOrderAddress(result));

    } catch (e) {
       emit(ErrorStateOrder(e.toString()));
    }
  }
}
