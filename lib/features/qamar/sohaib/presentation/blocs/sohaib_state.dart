import 'package:equatable/equatable.dart';

class SohaibState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SohaibStateInitial extends SohaibState {}

class SohaibStateLoading extends SohaibState {}

class SohaibStateSuccess extends SohaibState {
  final dynamic data;
  
  SohaibStateSuccess(this.data);
  
  @override
  List<Object?> get props => [data];
}

class SohaibStateFailure extends SohaibState {
  final String message;
  
  SohaibStateFailure(this.message);
  
  @override
  List<Object?> get props => [message];
}
