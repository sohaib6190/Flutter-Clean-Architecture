import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/facades/cs_use_cases_facade.dart';
import 'cs_event.dart';
import 'cs_state.dart';

class CsBloc extends Bloc<CsEvent, CsState> {
  final CsUseCasesFacade usecases;

  CsBloc({required this.usecases})
      : super(CsStateInitial()) {
    on<CsFetchEvent>(_onCsFetch);
  }

  Future<void> _onCsFetch(
    CsFetchEvent event,
    Emitter<CsState> emit,
  ) async {
    emit(CsStateLoading());

    final result = await usecases.fetchCs(event.params);

    result.fold(
      (failure) => emit(CsStateFailure(failure.message)),
      (data) => emit(CsStateSuccess(data)),
    );
  }
}
