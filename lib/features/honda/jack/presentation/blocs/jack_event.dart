import 'package:equatable/equatable.dart';

abstract class JackEvent extends Equatable {
  const JackEvent();

  @override
  List<Object?> get props => [];
}

class JackFetchEvent extends JackEvent {
  final dynamic params;
  
  const JackFetchEvent(this.params);
  
  @override
  List<Object?> get props => [params];
}

class JackSubmitEvent extends JackEvent {
  final dynamic data;
  
  const JackSubmitEvent(this.data);
  
  @override
  List<Object?> get props => [data];
}
