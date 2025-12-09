import 'package:equatable/equatable.dart';

abstract class ElectricalEvent extends Equatable {
  const ElectricalEvent();

  @override
  List<Object?> get props => [];
}

class ElectricalSubmitEvent extends ElectricalEvent {
  final dynamic data;
  
  const ElectricalSubmitEvent(this.data);
  
  @override
  List<Object?> get props => [data];
}
