import 'dart:developer';

import '../../../../../../core/constants/app_errors.dart';
import '../../../../../../core/errors/api_exceptions.dart';
import '../../../../../../core/network/client/dio_client.dart';
import '../../../../../../core/network/config/api_endpoints.dart';
import '../../../../../../core/network/config/error_handler.dart';
import '../../models/request/product_add_params.dart';
import '../../models/response/product_add_model.dart';
import 'product_add_remote_datasource.dart';

class ProductAddRemoteDatasourceImplementation implements ProductAddRemoteDatasource {
  final DioClient client;
  
  ProductAddRemoteDatasourceImplementation({required this.client});

  @override
  Future<ProductAddModel> productAdd(ProductAddParams params) async {
    log("Params is $params");
    return ApiErrorHandler.executeGuarded(() async {
      final response = await client.post(
        endpoint: ApiEndpoints.productAdd.value,
      data: params.toJson(),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return ProductAddModel.fromJson(response.data);
      } else {
        throw ServerException(
          statusCode: response.statusCode,
          message: response.data['message'] ?? AppErrors.somethingWentWrong,
        );
      }
    });
  }
}
