import 'package:fpdart/fpdart.dart';

import '../../../../../../app/errors/api_exceptions.dart';
import '../../data/models/request/{{name.snakeCase()}}_params.dart';
import '../../data/models/response/{{name.snakeCase()}}_model.dart';
import '../usecases/{{name.snakeCase()}}/{{name.snakeCase()}}_usecase.dart';

class {{name.pascalCase()}}UseCasesFacade {
  final {{name.pascalCase()}}Usecase {{name.camelCase()}}Usecase;

  {{name.pascalCase()}}UseCasesFacade({
    required this.{{name.camelCase()}}Usecase,
  });

  Future<Either<Failure, {{name.pascalCase()}}Model>> fetch{{name.pascalCase()}}(
    {{name.pascalCase()}}Params params,
  ) {
    return {{name.camelCase()}}Usecase(params);
  }
}
