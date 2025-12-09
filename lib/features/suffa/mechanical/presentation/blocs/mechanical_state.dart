import 'package:equatable/equatable.dart';

class MechanicalState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MechanicalStateInitial extends MechanicalState {}

class MechanicalStateLoading extends MechanicalState {}

class MechanicalStateSuccess extends MechanicalState {
  final dynamic data;
  
  MechanicalStateSuccess(this.data);
  
  @override
  List<Object?> get props => [data];
}

class MechanicalStateFailure extends MechanicalState {
  final String message;
  
  MechanicalStateFailure(this.message);
  
  @override
  List<Object?> get props => [message];
}
