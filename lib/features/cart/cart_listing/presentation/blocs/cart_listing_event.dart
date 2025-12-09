import 'package:equatable/equatable.dart';

abstract class CartListingEvent extends Equatable {
  const CartListingEvent();

  @override
  List<Object?> get props => [];
}

class CartListingFetchEvent extends CartListingEvent {
  final dynamic params;
  
  const CartListingFetchEvent(this.params);
  
  @override
  List<Object?> get props => [params];
}
