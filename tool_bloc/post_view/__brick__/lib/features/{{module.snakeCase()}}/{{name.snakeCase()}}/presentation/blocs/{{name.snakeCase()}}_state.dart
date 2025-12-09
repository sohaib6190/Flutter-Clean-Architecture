import 'package:equatable/equatable.dart';

class {{name.pascalCase()}}State extends Equatable {
  @override
  List<Object?> get props => [];
}

class {{name.pascalCase()}}StateInitial extends {{name.pascalCase()}}State {}

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
