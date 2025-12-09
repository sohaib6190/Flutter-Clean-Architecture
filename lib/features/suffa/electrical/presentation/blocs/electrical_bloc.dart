import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/facades/electrical_use_cases_facade.dart';
import 'electrical_event.dart';
import 'electrical_state.dart';

class ElectricalBloc extends Bloc<ElectricalEvent, ElectricalState> {
  final ElectricalUseCasesFacade usecases;

  ElectricalBloc({required this.usecases})
      : super(ElectricalStateInitial()) {
    on<ElectricalSubmitEvent>(_onElectricalSubmit);
  }

  Future<void> _onElectricalSubmit(
    ElectricalSubmitEvent event,
    Emitter<ElectricalState> emit,
  ) async {
    emit(ElectricalStateLoading());

    final result = await usecases.electrical(event.data);

    result.fold(
      (failure) => emit(ElectricalStateFailure(failure.message)),
      (data) => emit(ElectricalStateSuccess(data)),
    );
  }
}
