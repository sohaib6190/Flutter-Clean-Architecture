import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/facades/handle_use_cases_facade.dart';
import 'handle_event.dart';
import 'handle_state.dart';

class HandleBloc extends Bloc<HandleEvent, HandleState> {
  final HandleUseCasesFacade usecases;

  HandleBloc({required this.usecases})
      : super(HandleStateInitial()) {
    on<HandleFetchEvent>(_onHandleFetch);
    on<HandleSubmitEvent>(_onHandleSubmit);
  }

  Future<void> _onHandleFetch(
    HandleFetchEvent event,
    Emitter<HandleState> emit,
  ) async {
    emit(FetchHandleStateLoading());

    final result = await usecases.fetchHandle(event.params);

    result.fold(
      (failure) => emit(FetchHandleStateFailure(failure.message)),
      (data) => emit(FetchHandleStateSuccess(data)),
    );
  }

  Future<void> _onHandleSubmit(
    HandleSubmitEvent event,
    Emitter<HandleState> emit,
  ) async {
    emit(HandleStateLoading());

    final result = await usecases.handle(event.data);

    result.fold(
      (failure) => emit(HandleStateFailure(failure.message)),
      (data) => emit(HandleStateSuccess(data)),
    );
  }
}
