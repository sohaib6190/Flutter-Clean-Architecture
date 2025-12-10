import 'package:equatable/equatable.dart';

class CameraState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CameraStateInitial extends CameraState {}

// Fetch (GET) States
class FetchCameraStateLoading extends CameraState {}

class FetchCameraStateSuccess extends CameraState {
  final dynamic data;
  
  FetchCameraStateSuccess(this.data);
  
  @override
  List<Object?> get props => [data];
}

class FetchCameraStateFailure extends CameraState {
  final String message;
  
  FetchCameraStateFailure(this.message);
  
  @override
  List<Object?> get props => [message];
}

// POST States
class CameraStateLoading extends CameraState {}

class CameraStateSuccess extends CameraState {
  final dynamic data;
  
  CameraStateSuccess(this.data);
  
  @override
  List<Object?> get props => [data];
}

class CameraStateFailure extends CameraState {
  final String message;
  
  CameraStateFailure(this.message);
  
  @override
  List<Object?> get props => [message];
}
