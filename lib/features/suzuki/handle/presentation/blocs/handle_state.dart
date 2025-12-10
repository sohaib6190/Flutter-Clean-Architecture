import 'package:equatable/equatable.dart';

class HandleState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HandleStateInitial extends HandleState {}

// Fetch (GET) States
class FetchHandleStateLoading extends HandleState {}

class FetchHandleStateSuccess extends HandleState {
  final dynamic data;
  
  FetchHandleStateSuccess(this.data);
  
  @override
  List<Object?> get props => [data];
}

class FetchHandleStateFailure extends HandleState {
  final String message;
  
  FetchHandleStateFailure(this.message);
  
  @override
  List<Object?> get props => [message];
}

// POST States
class HandleStateLoading extends HandleState {}

class HandleStateSuccess extends HandleState {
  final dynamic data;
  
  HandleStateSuccess(this.data);
  
  @override
  List<Object?> get props => [data];
}

class HandleStateFailure extends HandleState {
  final String message;
  
  HandleStateFailure(this.message);
  
  @override
  List<Object?> get props => [message];
}
