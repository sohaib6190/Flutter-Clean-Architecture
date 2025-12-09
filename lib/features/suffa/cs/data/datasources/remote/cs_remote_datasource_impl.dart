import 'dart:developer';

import '../../../../../../app/constants/app_errors.dart';
import '../../../../../../app/errors/api_exceptions.dart';
import '../../../../../../app/network/client/dio_client.dart';
import '../../../../../../app/network/config/api_endpoints.dart';
import '../../../../../../app/network/config/error_handler.dart';
import '../../models/request/cs_params.dart';
import '../../models/response/cs_model.dart';
import 'cs_remote_datasource.dart';

class CsRemoteDatasourceImplementation implements CsRemoteDatasource {
  final DioClient client;
  
  CsRemoteDatasourceImplementation({required this.client});

  @override
  Future<CsModel> fetchCs(CsParams params) async {
    log("Params is $params");
    return ApiErrorHandler.executeGuarded(() async {
      final response = await client.get(
        endpoint: ApiEndpoints.addIssueFromProduction.value,
        queryParams: params.toJson(),
      );
      if (response.statusCode == 200) {
        return CsModel.fromJson(response.data);
      } else {
        throw ServerException(
          statusCode: response.statusCode,
          message: response.data['message'] ?? AppErrors.somethingWentWrong,
        );
      }
    });
  }
}
