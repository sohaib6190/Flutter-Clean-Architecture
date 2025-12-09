import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/facades/sohaib_use_cases_facade.dart';
import 'sohaib_event.dart';
import 'sohaib_state.dart';

class SohaibBloc extends Bloc<SohaibEvent, SohaibState> {
  final SohaibUseCasesFacade usecases;

  SohaibBloc({required this.usecases})
      : super(SohaibStateInitial()) {
    on<SohaibFetchEvent>(_onSohaibFetch);
  }

  Future<void> _onSohaibFetch(
    SohaibFetchEvent event,
    Emitter<SohaibState> emit,
  ) async {
    emit(SohaibStateLoading());

    final result = await usecases.fetchSohaib(event.params);

    result.fold(
      (failure) => emit(SohaibStateFailure(failure.message)),
      (data) => emit(SohaibStateSuccess(data)),
    );
  }
}
