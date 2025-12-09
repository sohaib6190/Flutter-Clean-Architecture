import 'package:equatable/equatable.dart';

class TestFeatureState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TestFeatureStateInitial extends TestFeatureState {}

class TestFeatureStateLoading extends TestFeatureState {}

class TestFeatureStateSuccess extends TestFeatureState {
  final dynamic data;
  
  TestFeatureStateSuccess(this.data);
  
  @override
  List<Object?> get props => [data];
}

class TestFeatureStateFailure extends TestFeatureState {
  final String message;
  
  TestFeatureStateFailure(this.message);
  
  @override
  List<Object?> get props => [message];
}
