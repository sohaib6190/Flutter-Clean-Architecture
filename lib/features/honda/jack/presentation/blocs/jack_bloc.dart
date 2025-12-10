import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/facades/jack_use_cases_facade.dart';
import 'jack_event.dart';
import 'jack_state.dart';

class JackBloc extends Bloc<JackEvent, JackState> {
  final JackUseCasesFacade usecases;

  JackBloc({required this.usecases})
      : super(JackStateInitial()) {
    on<JackFetchEvent>(_onJackFetch);
    on<JackSubmitEvent>(_onJackSubmit);
  }

  Future<void> _onJackFetch(
    JackFetchEvent event,
    Emitter<JackState> emit,
  ) async {
    emit(JackStateLoading());

    final result = await usecases.fetchJack(event.params);

    result.fold(
      (failure) => emit(JackStateFailure(failure.message)),
      (data) => emit(JackStateSuccess(data)),
    );
  }

  Future<void> _onJackSubmit(
    JackSubmitEvent event,
    Emitter<JackState> emit,
  ) async {
    emit(JackStateLoading());

    final result = await usecases.jack(event.data);

    result.fold(
      (failure) => emit(JackStateFailure(failure.message)),
      (data) => emit(JackStateSuccess(data)),
    );
  }
}
