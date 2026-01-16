import 'package:fpdart/fpdart.dart';

import '../../../../../../core/errors/api_exceptions.dart';
import '../../data/models/request/{{name.snakeCase()}}_params.dart';
import '../../data/models/response/{{name.snakeCase()}}_model.dart';

abstract class {{name.pascalCase()}}Repository {
  Future<Either<Failure, {{name.pascalCase()}}Model>> fetch{{name.pascalCase()}}({{name.pascalCase()}}Params params);
}
