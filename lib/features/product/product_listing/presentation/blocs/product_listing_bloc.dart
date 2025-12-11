import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/facades/product_listing_use_cases_facade.dart';
import 'product_listing_event.dart';
import 'product_listing_state.dart';

class ProductListingBloc extends Bloc<ProductListingEvent, ProductListingState> {
  final ProductListingUseCasesFacade usecases;

  ProductListingBloc({required this.usecases})
      : super(ProductListingStateInitial()) {
    on<ProductListingFetchEvent>(_onProductListingFetch);
  }

  Future<void> _onProductListingFetch(
    ProductListingFetchEvent event,
    Emitter<ProductListingState> emit,
  ) async {
    emit(ProductListingStateLoading());

    final result = await usecases.fetchProductListing(event.params);

    result.fold(
      (failure) => emit(ProductListingStateFailure(failure.message)),
      (data) => emit(ProductListingStateSuccess(data)),
    );
  }
}
