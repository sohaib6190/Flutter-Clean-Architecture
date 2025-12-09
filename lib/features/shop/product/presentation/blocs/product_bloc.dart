import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/facades/product_use_cases_facade.dart';
import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductUseCasesFacade usecases;

  ProductBloc({required this.usecases})
      : super(ProductStateInitial()) {
    on<ProductFetchEvent>(_onProductFetch);
  }

  Future<void> _onProductFetch(
    ProductFetchEvent event,
    Emitter<ProductState> emit,
  ) async {
    emit(ProductStateLoading());

    final result = await usecases.fetchProduct(event.params);

    result.fold(
      (failure) => emit(ProductStateFailure(failure.message)),
      (data) => emit(ProductStateSuccess(data)),
    );
  }
}
