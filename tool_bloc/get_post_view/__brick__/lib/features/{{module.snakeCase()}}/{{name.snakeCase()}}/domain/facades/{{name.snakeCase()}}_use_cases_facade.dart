import 'package:fpdart/fpdart.dart';

import '../../../../../../app/errors/api_exceptions.dart';
import '../../data/models/request/{{name.snakeCase()}}_params.dart';
import '../../data/models/response/{{name.snakeCase()}}_model.dart';
import '../usecases/fetch_{{name.snakeCase()}}/fetch_{{name.snakeCase()}}_usecase.dart';
import '../usecases/{{name.snakeCase()}}/{{name.snakeCase()}}_usecase.dart';

class {{name.pascalCase()}}UseCasesFacade {
  final Fetch{{name.pascalCase()}}Usecase fetch{{name.pascalCase()}}Usecase;
  final {{name.pascalCase()}}Usecase {{name.camelCase()}}Usecase;

  {{name.pascalCase()}}UseCasesFacade({
    required this.fetch{{name.pascalCase()}}Usecase,
    required this.{{name.camelCase()}}Usecase,
  });

  Future<Either<Failure, {{name.pascalCase()}}Model>> fetch{{name.pascalCase()}}(
    {{name.pascalCase()}}Params params,
  ) {
    return fetch{{name.pascalCase()}}Usecase(params);
  }

  Future<Either<Failure, {{name.pascalCase()}}Model>> {{name.camelCase()}}(
    {{name.pascalCase()}}Params params,
  ) {
    return {{name.camelCase()}}Usecase(params);
  }
}
