import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/facades/camera_use_cases_facade.dart';
import 'camera_event.dart';
import 'camera_state.dart';

class CameraBloc extends Bloc<CameraEvent, CameraState> {
  final CameraUseCasesFacade usecases;

  CameraBloc({required this.usecases})
      : super(CameraStateInitial()) {
    on<CameraFetchEvent>(_onCameraFetch);
    on<CameraSubmitEvent>(_onCameraSubmit);
  }

  Future<void> _onCameraFetch(
    CameraFetchEvent event,
    Emitter<CameraState> emit,
  ) async {
    emit(FetchCameraStateLoading());

    final result = await usecases.fetchCamera(event.params);

    result.fold(
      (failure) => emit(FetchCameraStateFailure(failure.message)),
      (data) => emit(FetchCameraStateSuccess(data)),
    );
  }

  Future<void> _onCameraSubmit(
    CameraSubmitEvent event,
    Emitter<CameraState> emit,
  ) async {
    emit(CameraStateLoading());

    final result = await usecases.camera(event.data);

    result.fold(
      (failure) => emit(CameraStateFailure(failure.message)),
      (data) => emit(CameraStateSuccess(data)),
    );
  }
}
