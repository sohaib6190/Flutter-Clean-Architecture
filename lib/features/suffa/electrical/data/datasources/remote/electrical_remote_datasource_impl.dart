import 'dart:developer';

import '../../../../../../app/constants/app_errors.dart';
import '../../../../../../app/errors/api_exceptions.dart';
import '../../../../../../app/network/client/dio_client.dart';
import '../../../../../../app/network/config/api_endpoints.dart';
import '../../../../../../app/network/config/error_handler.dart';
import '../../models/request/electrical_params.dart';
import '../../models/response/electrical_model.dart';
import 'electrical_remote_datasource.dart';

class ElectricalRemoteDatasourceImplementation implements ElectricalRemoteDatasource {
  final DioClient client;
  
  ElectricalRemoteDatasourceImplementation({required this.client});

  @override
  Future<ElectricalModel> electrical(ElectricalParams params) async {
    log("Params is $params");
    return ApiErrorHandler.executeGuarded(() async {
      final response = await client.post(
        endpoint: ApiEndpoints.changePassword.value,
        data: params.toJson(),
      );
      if (response.statusCode == 200) {
        return ElectricalModel.fromJson(response.data);
      } else {
        throw ServerException(
          statusCode: response.statusCode,
          message: response.data['message'] ?? AppErrors.somethingWentWrong,
        );
      }
    });
  }
}
