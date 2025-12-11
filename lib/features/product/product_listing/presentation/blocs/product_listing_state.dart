import 'package:equatable/equatable.dart';

import '../../data/models/response/product_listing_model.dart';

class ProductListingState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProductListingStateInitial extends ProductListingState {}

class ProductListingStateLoading extends ProductListingState {}

class ProductListingStateSuccess extends ProductListingState {
  final ProductListingModel data;
  
  ProductListingStateSuccess(this.data);
  
  @override
  List<Object?> get props => [data];
}

class ProductListingStateFailure extends ProductListingState {
  final String message;
  
  ProductListingStateFailure(this.message);
  
  @override
  List<Object?> get props => [message];
}
