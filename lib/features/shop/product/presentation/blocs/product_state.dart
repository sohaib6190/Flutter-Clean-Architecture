import 'package:equatable/equatable.dart';

class ProductState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProductStateInitial extends ProductState {}

class ProductStateLoading extends ProductState {}

class ProductStateSuccess extends ProductState {
  final dynamic data;
  
  ProductStateSuccess(this.data);
  
  @override
  List<Object?> get props => [data];
}

class ProductStateFailure extends ProductState {
  final String message;
  
  ProductStateFailure(this.message);
  
  @override
  List<Object?> get props => [message];
}
