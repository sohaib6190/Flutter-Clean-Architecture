import 'package:equatable/equatable.dart';

class CsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CsStateInitial extends CsState {}

class CsStateLoading extends CsState {}

class CsStateSuccess extends CsState {
  final dynamic data;
  
  CsStateSuccess(this.data);
  
  @override
  List<Object?> get props => [data];
}

class CsStateFailure extends CsState {
  final String message;
  
  CsStateFailure(this.message);
  
  @override
  List<Object?> get props => [message];
}
