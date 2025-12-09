import 'dart:developer';

import '../../../../../../app/constants/app_errors.dart';
import '../../../../../../app/errors/api_exceptions.dart';
import '../../../../../../app/network/client/dio_client.dart';
import '../../../../../../app/network/config/api_endpoints.dart';
import '../../../../../../app/network/config/error_handler.dart';
import '../../models/request/product_params.dart';
import '../../models/response/product_model.dart';
import 'product_remote_datasource.dart';

class ProductRemoteDatasourceImplementation implements ProductRemoteDatasource {
  final DioClient client;
  
  ProductRemoteDatasourceImplementation({required this.client});

  @override
  Future<ProductModel> fetchProduct(ProductParams params) async {
    log("Params is $params");
    return ApiErrorHandler.executeGuarded(() async {
      final response = await client.get(
        endpoint: ApiEndpoints.addReceiptFromProduction.value,
        queryParams: params.toJson(),
      );
      if (response.statusCode == 200) {
        return ProductModel.fromJson(response.data);
      } else {
        throw ServerException(
          statusCode: response.statusCode,
          message: response.data['message'] ?? AppErrors.somethingWentWrong,
        );
      }
    });
  }
}
