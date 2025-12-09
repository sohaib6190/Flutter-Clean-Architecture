import 'package:equatable/equatable.dart';

abstract class {{name.pascalCase()}}Event extends Equatable {
  const {{name.pascalCase()}}Event();

  @override
  List<Object?> get props => [];
}

class {{name.pascalCase()}}SubmitEvent extends {{name.pascalCase()}}Event {
  final dynamic data;
  
  const {{name.pascalCase()}}SubmitEvent(this.data);
  
  @override
  List<Object?> get props => [data];
}
