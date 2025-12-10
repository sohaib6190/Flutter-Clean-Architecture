import 'dart:developer';

import '../../../../../../app/constants/app_errors.dart';
import '../../../../../../app/errors/api_exceptions.dart';
import '../../../../../../app/network/client/dio_client.dart';
import '../../../../../../app/network/config/api_endpoints.dart';
import '../../../../../../app/network/config/error_handler.dart';
import '../../models/request/{{name.snakeCase()}}_params.dart';
import '../../models/response/{{name.snakeCase()}}_model.dart';
import '{{name.snakeCase()}}_remote_datasource.dart';

class {{name.pascalCase()}}RemoteDatasourceImplementation implements {{name.pascalCase()}}RemoteDatasource {
  final DioClient client;
  
  {{name.pascalCase()}}RemoteDatasourceImplementation({required this.client});

  @override
  Future<{{name.pascalCase()}}Model> fetch{{name.pascalCase()}}({{name.pascalCase()}}Params params) async {
    log("Params is $params");
    return ApiErrorHandler.executeGuarded(() async {
      final response = await client.get(
        endpoint: ApiEndpoints.{{name.camelCase()}}.value,
        queryParams: params.toJson(),
      );
      if (response.statusCode == 200) {
        return {{name.pascalCase()}}Model.fromJson(response.data);
      } else {
        throw ServerException(
          statusCode: response.statusCode,
          message: response.data['message'] ?? AppErrors.somethingWentWrong,
        );
      }
    });
  }

  @override
  Future<{{name.pascalCase()}}Model> {{name.camelCase()}}({{name.pascalCase()}}Params params) async {
    log("Params is $params");
    return ApiErrorHandler.executeGuarded(() async {
      final response = await client.post(
        endpoint: ApiEndpoints.{{name.camelCase()}}.value,
        data: params.toJson(),
      );
      if (response.statusCode == 200) {
        return {{name.pascalCase()}}Model.fromJson(response.data);
      } else {
        throw ServerException(
          statusCode: response.statusCode,
          message: response.data['message'] ?? AppErrors.somethingWentWrong,
        );
      }
    });
  }
}
