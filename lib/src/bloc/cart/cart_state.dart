 import 'package:digitalkarobaar/src/models/product_cart.dart';
import 'package:equatable/equatable.dart';

abstract class CartState extends Equatable{}

 class LoadingCart extends CartState{
  @override
  List<Object> get props => [];
}
 class SuccessStateCart extends CartState{
    final message;
    SuccessStateCart({this.message});
  @override
  List<Object> get props => [message];
}
 class SuccessCartRemove extends CartState{
    final message;
    SuccessCartRemove ({this.message});
  @override
  List<Object> get props => [message];
}
 class CartItems extends CartState{
   CartItems(this.items);
   ProductCart items;
  @override
  List<Object> get props => [items];
}


 class ErrorStateCart extends CartState{
    ErrorStateCart(this.message);
   final message;
  @override
  List<Object> get props => [message];
}
