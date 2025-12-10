import 'package:equatable/equatable.dart';

abstract class HandleEvent extends Equatable {
  const HandleEvent();

  @override
  List<Object?> get props => [];
}

class HandleFetchEvent extends HandleEvent {
  final dynamic params;
  
  const HandleFetchEvent(this.params);
  
  @override
  List<Object?> get props => [params];
}

class HandleSubmitEvent extends HandleEvent {
  final dynamic data;
  
  const HandleSubmitEvent(this.data);
  
  @override
  List<Object?> get props => [data];
}
