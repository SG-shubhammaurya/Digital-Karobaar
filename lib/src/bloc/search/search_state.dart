import 'package:digitalkarobaar/src/models/products.dart';
import 'package:equatable/equatable.dart';

abstract class SearchState extends Equatable {}

class InitialSate extends SearchState {
  @override
  List<Object> get props => [];
}

class LoadingSate extends SearchState {
  @override
  List<Object> get props => [];
}

class SuccessfulState extends SearchState {
  final Products searchedProduts;
  SuccessfulState(this.searchedProduts);
  @override
  List<Object> get props => [searchedProduts];
}

class ErrorState extends SearchState {
  final message;
  ErrorState(this.message);
  @override
  List<Object> get props => [message];
}
