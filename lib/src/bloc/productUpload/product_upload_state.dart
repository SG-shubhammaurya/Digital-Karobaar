import 'package:digitalkarobaar/src/models/brand.dart';
import 'package:digitalkarobaar/src/models/categories.dart';
import 'package:digitalkarobaar/src/models/sub_categories.dart';
import 'package:equatable/equatable.dart';

abstract class ProductUploadState extends Equatable {}

class LoadingStateCategories extends ProductUploadState {
  @override
  List<Object> get props => [];
}
class LoadingStateSubCategories extends ProductUploadState {
  @override
  List<Object> get props => [];
}
class LoadingStateBrand extends ProductUploadState {
  @override
  List<Object> get props => [];
}
class LoadingStateProduct extends ProductUploadState {
  @override
  List<Object> get props => [];
}
class SuccessStateUploaded extends ProductUploadState {
  final message;
  SuccessStateUploaded(this.message);
  @override
  List<Object> get props => [];
}

class ProductInitialSate extends ProductUploadState {
  @override
  List<Object> get props => [];
}

class GetCategories extends ProductUploadState {
  final List<Categories> categories;
  GetCategories(this.categories);
  @override
  List<Object> get props => [categories];
}

class GetSubCategories extends ProductUploadState {
  final List<SubCategory> subCategories;
  GetSubCategories(this.subCategories);
  @override
  List<Object> get props => [subCategories];
}

class GetBrandState extends ProductUploadState {
  final List<Brand> brand;
  GetBrandState(this.brand);
  @override
  List<Object> get props => [brand];
}

class ErrorState extends ProductUploadState {
  ErrorState(this.message);
  final message;
  @override
  List<Object> get props => [message];
}
