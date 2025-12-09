import 'package:equatable/equatable.dart';

abstract class SohaibEvent extends Equatable {
  const SohaibEvent();

  @override
  List<Object?> get props => [];
}

class SohaibFetchEvent extends SohaibEvent {
  final dynamic params;
  
  const SohaibFetchEvent(this.params);
  
  @override
  List<Object?> get props => [params];
}
