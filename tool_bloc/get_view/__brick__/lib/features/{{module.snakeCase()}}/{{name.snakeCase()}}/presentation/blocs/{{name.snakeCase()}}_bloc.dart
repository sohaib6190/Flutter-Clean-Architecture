import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/facades/{{name.snakeCase()}}_use_cases_facade.dart';
import '{{name.snakeCase()}}_event.dart';
import '{{name.snakeCase()}}_state.dart';

class {{name.pascalCase()}}Bloc extends Bloc<{{name.pascalCase()}}Event, {{name.pascalCase()}}State> {
  final {{name.pascalCase()}}UseCasesFacade usecases;

  {{name.pascalCase()}}Bloc({required this.usecases})
      : super({{name.pascalCase()}}StateInitial()) {
    on<{{name.pascalCase()}}FetchEvent>(_on{{name.pascalCase()}}Fetch);
  }

  Future<void> _on{{name.pascalCase()}}Fetch(
    {{name.pascalCase()}}FetchEvent event,
    Emitter<{{name.pascalCase()}}State> emit,
  ) async {
    emit({{name.pascalCase()}}StateLoading());

    final result = await usecases.fetch{{name.pascalCase()}}(event.params);

    result.fold(
      (failure) => emit({{name.pascalCase()}}StateFailure(failure.message)),
      (data) => emit({{name.pascalCase()}}StateSuccess(data)),
    );
  }
}
