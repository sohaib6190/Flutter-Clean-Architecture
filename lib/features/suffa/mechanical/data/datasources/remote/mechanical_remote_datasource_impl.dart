import 'dart:developer';

import '../../../../../../app/constants/app_errors.dart';
import '../../../../../../app/errors/api_exceptions.dart';
import '../../../../../../app/network/client/dio_client.dart';
import '../../../../../../app/network/config/api_endpoints.dart';
import '../../../../../../app/network/config/error_handler.dart';
import '../../models/request/mechanical_params.dart';
import '../../models/response/mechanical_model.dart';
import 'mechanical_remote_datasource.dart';

class MechanicalRemoteDatasourceImplementation implements MechanicalRemoteDatasource {
  final DioClient client;
  
  MechanicalRemoteDatasourceImplementation({required this.client});

  @override
  Future<MechanicalModel> fetchMechanical(MechanicalParams params) async {
    log("Params is $params");
    return ApiErrorHandler.executeGuarded(() async {
      final response = await client.get(
        endpoint: ApiEndpoints.mechanical.value,
        queryParams: params.toJson(),
      );
      if (response.statusCode == 200) {
        return MechanicalModel.fromJson(response.data);
      } else {
        throw ServerException(
          statusCode: response.statusCode,
          message: response.data['message'] ?? AppErrors.somethingWentWrong,
        );
      }
    });
  }
}
