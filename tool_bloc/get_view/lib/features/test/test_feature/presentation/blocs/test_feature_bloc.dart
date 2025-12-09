import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/facades/test_feature_use_cases_facade.dart';
import 'test_feature_event.dart';
import 'test_feature_state.dart';

class TestFeatureBloc extends Bloc<TestFeatureEvent, TestFeatureState> {
  final TestFeatureUseCasesFacade usecases;

  TestFeatureBloc({required this.usecases})
      : super(TestFeatureStateInitial()) {
    on<TestFeatureFetchEvent>(_onTestFeatureFetch);
  }

  Future<void> _onTestFeatureFetch(
    TestFeatureFetchEvent event,
    Emitter<TestFeatureState> emit,
  ) async {
    emit(TestFeatureStateLoading());

    final result = await usecases.fetchTestFeature(event.params);

    result.fold(
      (failure) => emit(TestFeatureStateFailure(failure.message)),
      (data) => emit(TestFeatureStateSuccess(data)),
    );
  }
}
