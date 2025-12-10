import 'dart:developer';

import '../../../../../../app/constants/app_errors.dart';
import '../../../../../../app/errors/api_exceptions.dart';
import '../../../../../../app/network/client/dio_client.dart';
import '../../../../../../app/network/config/api_endpoints.dart';
import '../../../../../../app/network/config/error_handler.dart';
import '../../models/request/camera_params.dart';
import '../../models/response/camera_model.dart';
import 'camera_remote_datasource.dart';

class CameraRemoteDatasourceImplementation implements CameraRemoteDatasource {
  final DioClient client;
  
  CameraRemoteDatasourceImplementation({required this.client});

  @override
  Future<CameraModel> fetchCamera(CameraParams params) async {
    log("Params is $params");
    return ApiErrorHandler.executeGuarded(() async {
      final response = await client.get(
        endpoint: ApiEndpoints.get2FASecretKey.value,
        queryParams: params.toJson(),
      );
      if (response.statusCode == 200) {
        return CameraModel.fromJson(response.data);
      } else {
        throw ServerException(
          statusCode: response.statusCode,
          message: response.data['message'] ?? AppErrors.somethingWentWrong,
        );
      }
    });
  }

  @override
  Future<CameraModel> camera(CameraParams params) async {
    log("Params is $params");
    return ApiErrorHandler.executeGuarded(() async {
      final response = await client.post(
        endpoint: ApiEndpoints.checkIfGoodIssueExists.value,
        data: params.toJson(),
      );
      if (response.statusCode == 200) {
        return CameraModel.fromJson(response.data);
      } else {
        throw ServerException(
          statusCode: response.statusCode,
          message: response.data['message'] ?? AppErrors.somethingWentWrong,
        );
      }
    });
  }
}
