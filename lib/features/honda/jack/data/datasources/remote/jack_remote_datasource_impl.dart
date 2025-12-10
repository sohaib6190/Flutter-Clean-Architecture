import 'dart:developer';

import '../../../../../../app/constants/app_errors.dart';
import '../../../../../../app/errors/api_exceptions.dart';
import '../../../../../../app/network/client/dio_client.dart';
import '../../../../../../app/network/config/api_endpoints.dart';
import '../../../../../../app/network/config/error_handler.dart';
import '../../models/request/jack_params.dart';
import '../../models/response/jack_model.dart';
import 'jack_remote_datasource.dart';

class JackRemoteDatasourceImplementation implements JackRemoteDatasource {
  final DioClient client;
  
  JackRemoteDatasourceImplementation({required this.client});

  @override
  Future<JackModel> fetchJack(JackParams params) async {
    log("Params is $params");
    return ApiErrorHandler.executeGuarded(() async {
      final response = await client.get(
        endpoint: ApiEndpoints.get2FASecretKey.value,
        queryParams: params.toJson(),
      );
      if (response.statusCode == 200) {
        return JackModel.fromJson(response.data);
      } else {
        throw ServerException(
          statusCode: response.statusCode,
          message: response.data['message'] ?? AppErrors.somethingWentWrong,
        );
      }
    });
  }

  @override
  Future<JackModel> jack(JackParams params) async {
    log("Params is $params");
    return ApiErrorHandler.executeGuarded(() async {
      final response = await client.post(
        endpoint: ApiEndpoints.addIssueFromProduction.value,
        data: params.toJson(),
      );
      if (response.statusCode == 200) {
        return JackModel.fromJson(response.data);
      } else {
        throw ServerException(
          statusCode: response.statusCode,
          message: response.data['message'] ?? AppErrors.somethingWentWrong,
        );
      }
    });
  }
}
