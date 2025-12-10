import 'package:equatable/equatable.dart';

class JackState extends Equatable {
  @override
  List<Object?> get props => [];
}

class JackStateInitial extends JackState {}

class JackStateLoading extends JackState {}

class JackStateSuccess extends JackState {
  final dynamic data;
  
  JackStateSuccess(this.data);
  
  @override
  List<Object?> get props => [data];
}

class JackStateFailure extends JackState {
  final String message;
  
  JackStateFailure(this.message);
  
  @override
  List<Object?> get props => [message];
}
