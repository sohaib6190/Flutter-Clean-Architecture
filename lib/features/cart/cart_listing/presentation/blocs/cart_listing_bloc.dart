import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/facades/cart_listing_use_cases_facade.dart';
import 'cart_listing_event.dart';
import 'cart_listing_state.dart';

class CartListingBloc extends Bloc<CartListingEvent, CartListingState> {
  final CartListingUseCasesFacade usecases;

  CartListingBloc({required this.usecases})
      : super(CartListingStateInitial()) {
    on<CartListingFetchEvent>(_onCartListingFetch);
  }

  Future<void> _onCartListingFetch(
    CartListingFetchEvent event,
    Emitter<CartListingState> emit,
  ) async {
    emit(CartListingStateLoading());

    final result = await usecases.fetchCartListing(event.params);

    result.fold(
      (failure) => emit(CartListingStateFailure(failure.message)),
      (data) => emit(CartListingStateSuccess(data)),
    );
  }
}
