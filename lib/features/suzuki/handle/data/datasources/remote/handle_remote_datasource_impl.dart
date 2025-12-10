import 'dart:developer';

import '../../../../../../app/constants/app_errors.dart';
import '../../../../../../app/errors/api_exceptions.dart';
import '../../../../../../app/network/client/dio_client.dart';
import '../../../../../../app/network/config/api_endpoints.dart';
import '../../../../../../app/network/config/error_handler.dart';
import '../../models/request/handle_params.dart';
import '../../models/response/handle_model.dart';
import 'handle_remote_datasource.dart';

class HandleRemoteDatasourceImplementation implements HandleRemoteDatasource {
  final DioClient client;
  
  HandleRemoteDatasourceImplementation({required this.client});

  @override
  Future<HandleModel> fetchHandle(HandleParams params) async {
    log("Params is $params");
    return ApiErrorHandler.executeGuarded(() async {
      final response = await client.get(
        endpoint: ApiEndpoints.get2FASecretKey.value,
        queryParams: params.toJson(),
      );
      if (response.statusCode == 200) {
        return HandleModel.fromJson(response.data);
      } else {
        throw ServerException(
          statusCode: response.statusCode,
          message: response.data['message'] ?? AppErrors.somethingWentWrong,
        );
      }
    });
  }

  @override
  Future<HandleModel> handle(HandleParams params) async {
    log("Params is $params");
    return ApiErrorHandler.executeGuarded(() async {
      final response = await client.post(
        endpoint: ApiEndpoints.get2FASecretKey.value,
        data: params.toJson(),
      );
      if (response.statusCode == 200) {
        return HandleModel.fromJson(response.data);
      } else {
        throw ServerException(
          statusCode: response.statusCode,
          message: response.data['message'] ?? AppErrors.somethingWentWrong,
        );
      }
    });
  }
}
