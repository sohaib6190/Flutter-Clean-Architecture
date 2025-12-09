import 'package:equatable/equatable.dart';

abstract class MechanicalEvent extends Equatable {
  const MechanicalEvent();

  @override
  List<Object?> get props => [];
}

class MechanicalFetchEvent extends MechanicalEvent {
  final dynamic params;
  
  const MechanicalFetchEvent(this.params);
  
  @override
  List<Object?> get props => [params];
}
