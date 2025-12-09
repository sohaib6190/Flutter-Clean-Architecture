import 'dart:developer';

import '../../../../../../app/constants/app_errors.dart';
import '../../../../../../app/errors/api_exceptions.dart';
import '../../../../../../app/network/client/dio_client.dart';
import '../../../../../../app/network/config/api_endpoints.dart';
import '../../../../../../app/network/config/error_handler.dart';
import '../../models/request/sohaib_params.dart';
import '../../models/response/sohaib_model.dart';
import 'sohaib_remote_datasource.dart';

class SohaibRemoteDatasourceImplementation implements SohaibRemoteDatasource {
  final DioClient client;
  
  SohaibRemoteDatasourceImplementation({required this.client});

  @override
  Future<SohaibModel> fetchSohaib(SohaibParams params) async {
    log("Params is $params");
    return ApiErrorHandler.executeGuarded(() async {
      final response = await client.get(
        endpoint: ApiEndpoints.addIssueFromProduction.value,
        queryParams: params.toJson(),
      );
      if (response.statusCode == 200) {
        return SohaibModel.fromJson(response.data);
      } else {
        throw ServerException(
          statusCode: response.statusCode,
          message: response.data['message'] ?? AppErrors.somethingWentWrong,
        );
      }
    });
  }
}
