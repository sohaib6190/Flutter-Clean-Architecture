import '../../models/request/{{name.snakeCase()}}_params.dart';
import '../../models/response/{{name.snakeCase()}}_model.dart';

abstract class {{name.pascalCase()}}RemoteDatasource {
  {{name.pascalCase()}}RemoteDatasource();

  Future<{{name.pascalCase()}}Model> {{name.camelCase()}}({{name.pascalCase()}}Params params);
}
