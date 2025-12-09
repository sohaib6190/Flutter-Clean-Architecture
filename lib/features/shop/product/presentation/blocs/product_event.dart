import 'package:equatable/equatable.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object?> get props => [];
}

class ProductFetchEvent extends ProductEvent {
  final dynamic params;
  
  const ProductFetchEvent(this.params);
  
  @override
  List<Object?> get props => [params];
}
