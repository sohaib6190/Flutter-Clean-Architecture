import 'package:equatable/equatable.dart';

class {{name.pascalCase()}}State extends Equatable {
  @override
  List<Object?> get props => [];
}

class {{name.pascalCase()}}StateInitial extends {{name.pascalCase()}}State {}

// Fetch (GET) States
class Fetch{{name.pascalCase()}}StateLoading extends {{name.pascalCase()}}State {}

class Fetch{{name.pascalCase()}}StateSuccess extends {{name.pascalCase()}}State {
  final dynamic data;
  
  Fetch{{name.pascalCase()}}StateSuccess(this.data);
  
  @override
  List<Object?> get props => [data];
}

class Fetch{{name.pascalCase()}}StateFailure extends {{name.pascalCase()}}State {
  final String message;
  
  Fetch{{name.pascalCase()}}StateFailure(this.message);
  
  @override
  List<Object?> get props => [message];
}

// POST States
class {{name.pascalCase()}}StateLoading extends {{name.pascalCase()}}State {}

class {{name.pascalCase()}}StateSuccess extends {{name.pascalCase()}}State {
  final dynamic data;
  
  {{name.pascalCase()}}StateSuccess(this.data);
  
  @override
  List<Object?> get props => [data];
}

class {{name.pascalCase()}}StateFailure extends {{name.pascalCase()}}State {
  final String message;
  
  {{name.pascalCase()}}StateFailure(this.message);
  
  @override
  List<Object?> get props => [message];
}
