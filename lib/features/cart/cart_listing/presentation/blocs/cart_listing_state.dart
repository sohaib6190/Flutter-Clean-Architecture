import 'package:equatable/equatable.dart';

class CartListingState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CartListingStateInitial extends CartListingState {}

class CartListingStateLoading extends CartListingState {}

class CartListingStateSuccess extends CartListingState {
  final dynamic data;
  
  CartListingStateSuccess(this.data);
  
  @override
  List<Object?> get props => [data];
}

class CartListingStateFailure extends CartListingState {
  final String message;
  
  CartListingStateFailure(this.message);
  
  @override
  List<Object?> get props => [message];
}
