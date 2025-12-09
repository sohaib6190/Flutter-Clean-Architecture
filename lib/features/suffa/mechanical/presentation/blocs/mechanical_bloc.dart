import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/facades/mechanical_use_cases_facade.dart';
import 'mechanical_event.dart';
import 'mechanical_state.dart';

class MechanicalBloc extends Bloc<MechanicalEvent, MechanicalState> {
  final MechanicalUseCasesFacade usecases;

  MechanicalBloc({required this.usecases})
      : super(MechanicalStateInitial()) {
    on<MechanicalFetchEvent>(_onMechanicalFetch);
  }

  Future<void> _onMechanicalFetch(
    MechanicalFetchEvent event,
    Emitter<MechanicalState> emit,
  ) async {
    emit(MechanicalStateLoading());

    final result = await usecases.fetchMechanical(event.params);

    result.fold(
      (failure) => emit(MechanicalStateFailure(failure.message)),
      (data) => emit(MechanicalStateSuccess(data)),
    );
  }
}
