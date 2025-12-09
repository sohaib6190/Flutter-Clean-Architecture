import 'package:equatable/equatable.dart';

abstract class TestFeatureEvent extends Equatable {
  const TestFeatureEvent();

  @override
  List<Object?> get props => [];
}

class TestFeatureFetchEvent extends TestFeatureEvent {
  final dynamic params;
  
  const TestFeatureFetchEvent(this.params);
  
  @override
  List<Object?> get props => [params];
}
