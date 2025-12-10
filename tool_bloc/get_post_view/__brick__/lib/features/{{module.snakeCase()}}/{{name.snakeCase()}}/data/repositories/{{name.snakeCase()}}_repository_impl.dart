import 'package:fpdart/fpdart.dart';

import '../../../../../../app/errors/api_exceptions.dart';
import '../../domain/repositories/{{name.snakeCase()}}_repository.dart';
import '../datasources/remote/{{name.snakeCase()}}_remote_datasource.dart';
import '../models/request/{{name.snakeCase()}}_params.dart';
import '../models/response/{{name.snakeCase()}}_model.dart';

class {{name.pascalCase()}}RepositoryImplementation implements {{name.pascalCase()}}Repository {
  final {{name.pascalCase()}}RemoteDatasource remoteDatasource;

  {{name.pascalCase()}}RepositoryImplementation({required this.remoteDatasource});

  @override
  Future<Either<Failure, {{name.pascalCase()}}Model>> fetch{{name.pascalCase()}}(
    {{name.pascalCase()}}Params params,
  ) async {
    try {
      final response = await remoteDatasource.fetch{{name.pascalCase()}}(params);
      return right(response);
    } on Failure catch (e) {
      return left(Failure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, {{name.pascalCase()}}Model>> {{name.camelCase()}}(
    {{name.pascalCase()}}Params params,
  ) async {
    try {
      final response = await remoteDatasource.{{name.camelCase()}}(params);
      return right(response);
    } on Failure catch (e) {
      return left(Failure(message: e.message));
    }
  }
}
