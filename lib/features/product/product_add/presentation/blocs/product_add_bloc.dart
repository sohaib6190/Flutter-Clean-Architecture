import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/facades/product_add_use_cases_facade.dart';
import 'product_add_event.dart';
import 'product_add_state.dart';

class ProductAddBloc extends Bloc<ProductAddEvent, ProductAddState> {
  final ProductAddUseCasesFacade usecases;

  ProductAddBloc({required this.usecases})
      : super(ProductAddStateInitial()) {
    on<ProductAddSubmitEvent>(_onProductAddSubmit);
  }

  Future<void> _onProductAddSubmit(
    ProductAddSubmitEvent event,
    Emitter<ProductAddState> emit,
  ) async {
    emit(ProductAddStateLoading());

    final result = await usecases.productAdd(event.data);

    result.fold(
      (failure) => emit(ProductAddStateFailure(failure.message)),
      (data) => emit(ProductAddStateSuccess(data)),
    );
  }
}
