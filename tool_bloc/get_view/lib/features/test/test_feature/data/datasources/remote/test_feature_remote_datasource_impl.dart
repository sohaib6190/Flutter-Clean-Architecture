import 'dart:developer';

import '../../../../../../app/constants/app_errors.dart';
import '../../../../../../app/errors/api_exceptions.dart';
import '../../../../../../app/network/client/dio_client.dart';
import '../../../../../../app/network/config/api_endpoints.dart';
import '../../../../../../app/network/config/error_handler.dart';
import '../../models/request/test_feature_params.dart';
import '../../models/response/test_feature_model.dart';
import 'test_feature_remote_datasource.dart';

class TestFeatureRemoteDatasourceImplementation implements TestFeatureRemoteDatasource {
  final DioClient client;
  
  TestFeatureRemoteDatasourceImplementation({required this.client});

  @override
  Future<TestFeatureModel> fetchTestFeature(TestFeatureParams params) async {
    log("Params is $params");
    return ApiErrorHandler.executeGuarded(() async {
      final response = await client.get(
        endpoint: ApiEndpoints.testFeature.value,
        queryParams: params.toJson(),
      );
      if (response.statusCode == 200) {
        return TestFeatureModel.fromJson(response.data);
      } else {
        throw ServerException(
          statusCode: response.statusCode,
          message: response.data['message'] ?? AppErrors.somethingWentWrong,
        );
      }
    });
  }
}
