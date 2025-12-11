import 'package:equatable/equatable.dart';

class ProductAddState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProductAddStateInitial extends ProductAddState {}

class ProductAddStateLoading extends ProductAddState {}

class ProductAddStateSuccess extends ProductAddState {
  final dynamic data;
  
  ProductAddStateSuccess(this.data);
  
  @override
  List<Object?> get props => [data];
}

class ProductAddStateFailure extends ProductAddState {
  final String message;
  
  ProductAddStateFailure(this.message);
  
  @override
  List<Object?> get props => [message];
}
