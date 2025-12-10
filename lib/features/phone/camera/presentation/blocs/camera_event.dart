import 'package:equatable/equatable.dart';

abstract class CameraEvent extends Equatable {
  const CameraEvent();

  @override
  List<Object?> get props => [];
}

class CameraFetchEvent extends CameraEvent {
  final dynamic params;
  
  const CameraFetchEvent(this.params);
  
  @override
  List<Object?> get props => [params];
}

class CameraSubmitEvent extends CameraEvent {
  final dynamic data;
  
  const CameraSubmitEvent(this.data);
  
  @override
  List<Object?> get props => [data];
}
