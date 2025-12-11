import 'package:equatable/equatable.dart';

abstract class ProductAddEvent extends Equatable {
  const ProductAddEvent();

  @override
  List<Object?> get props => [];
}

class ProductAddSubmitEvent extends ProductAddEvent {
  final dynamic data;
  
  const ProductAddSubmitEvent(this.data);
  
  @override
  List<Object?> get props => [data];
}
