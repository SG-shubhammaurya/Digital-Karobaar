import 'package:digitalkarobaar/src/models/order_address.dart';
import 'package:digitalkarobaar/src/models/order_res.dart';
import 'package:equatable/equatable.dart';

abstract class OrderPlaceState extends Equatable {}

class LoadingStateOrder extends OrderPlaceState {
  @override
  List<Object> get props => [];
}

class SuccessStateOrder extends OrderPlaceState {
  final message;
  SuccessStateOrder(this.message);
  @override
  List<Object> get props => [];
}
class OrderInitialSate extends OrderPlaceState {
  @override
  List<Object> get props => [];
}
class GetOrderAddress extends OrderPlaceState {
  List<OrderAddress> orderAdd;
  GetOrderAddress(this.orderAdd);
  @override
  List<Object> get props => [orderAdd];
}

class GetOrderResponse extends OrderPlaceState {
  OrderResponce orderSuccessRes;
  GetOrderResponse(this.orderSuccessRes);
  @override
  List<Object> get props => [orderSuccessRes];
}

class ErrorStateOrder extends OrderPlaceState {
  ErrorStateOrder(this.message);
  final message;
  @override
  List<Object> get props => [message];
}
