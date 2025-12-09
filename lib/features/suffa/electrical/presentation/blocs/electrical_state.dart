import 'package:equatable/equatable.dart';

class ElectricalState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ElectricalStateInitial extends ElectricalState {}

class ElectricalStateLoading extends ElectricalState {}

class ElectricalStateSuccess extends ElectricalState {
  final dynamic data;
  
  ElectricalStateSuccess(this.data);
  
  @override
  List<Object?> get props => [data];
}

class ElectricalStateFailure extends ElectricalState {
  final String message;
  
  ElectricalStateFailure(this.message);
  
  @override
  List<Object?> get props => [message];
}
