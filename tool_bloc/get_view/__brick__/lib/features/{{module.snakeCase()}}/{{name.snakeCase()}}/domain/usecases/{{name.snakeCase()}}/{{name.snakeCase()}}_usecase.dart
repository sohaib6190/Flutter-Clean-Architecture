import 'package:fpdart/fpdart.dart';

import '../../../../../../../core/errors/api_exceptions.dart';
import '../../../../../../../core/use_cases/use_case.dart';
import '../../../data/models/request/{{name.snakeCase()}}_params.dart';
import '../../../data/models/response/{{name.snakeCase()}}_model.dart';
import '../../repositories/{{name.snakeCase()}}_repository.dart';

class {{name.pascalCase()}}Usecase extends UseCase<{{name.pascalCase()}}Model, {{name.pascalCase()}}Params> {
  final {{name.pascalCase()}}Repository repository;

  {{name.pascalCase()}}Usecase(this.repository);

  @override
  Future<Either<Failure, {{name.pascalCase()}}Model>> call(
    {{name.pascalCase()}}Params params,
  ) async {
    return repository.fetch{{name.pascalCase()}}(params);
  }
}
