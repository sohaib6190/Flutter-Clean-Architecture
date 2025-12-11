import 'package:equatable/equatable.dart';

import '../../data/models/request/product_listing_params.dart';

abstract class ProductListingEvent extends Equatable {
  const ProductListingEvent();

  @override
  List<Object?> get props => [];
}

class ProductListingFetchEvent extends ProductListingEvent {
  final ProductListingParams params;
  
  const ProductListingFetchEvent(this.params);
  
  @override
  List<Object?> get props => [params];
}
