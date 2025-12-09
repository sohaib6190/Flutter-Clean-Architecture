import 'package:equatable/equatable.dart';

abstract class CsEvent extends Equatable {
  const CsEvent();

  @override
  List<Object?> get props => [];
}

class CsFetchEvent extends CsEvent {
  final dynamic params;
  
  const CsFetchEvent(this.params);
  
  @override
  List<Object?> get props => [params];
}
