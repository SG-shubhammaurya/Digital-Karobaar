import 'package:equatable/equatable.dart';

abstract class SellerDetail extends Equatable {}

class SellerDetailInitialSate extends SellerDetail {
  @override
  List<Object> get props => [];
}

class SellerDetailLoadingSate extends SellerDetail {
  @override
  List<Object> get props => [];
}

class SellerDetailLoadedState extends SellerDetail {
   final result;
   SellerDetailLoadedState(this.result);
  @override
  List<Object> get props => [result];
}
class LoadedCities extends SellerDetail {
   final cities;
   LoadedCities(this.cities);
  @override
  List<Object> get props => [cities];
}
class Success extends SellerDetail {
   final id;
   Success(this.id);
  @override
  List<Object> get props => [id];
}


class SellerDetailErrorState extends SellerDetail {
  @override
  List<Object> get props => [];
}
class SellerDetailUpdateState extends SellerDetail {
  @override
  List<Object> get props => [];
}
