import 'dart:developer';

import '../../../../../../core/constants/app_errors.dart';
import '../../../../../../core/errors/api_exceptions.dart';
import '../../../../../../core/network/client/dio_client.dart';
import '../../../../../../core/network/config/api_endpoints.dart';
import '../../../../../../core/network/config/error_handler.dart';
import '../../models/request/product_listing_params.dart';
import '../../models/response/product_listing_model.dart';
import 'product_listing_remote_datasource.dart';

class ProductListingRemoteDatasourceImplementation implements ProductListingRemoteDatasource {
  final DioClient client;
  
  ProductListingRemoteDatasourceImplementation({required this.client});

  @override
  Future<ProductListingModel> fetchProductListing(ProductListingParams params) async {
    log("Params is $params");
    return ApiErrorHandler.executeGuarded(() async {
      final response = await client.get(
        endpoint: ApiEndpoints.productListing.value,
   
      );
      if (response.statusCode == 200) {
        return ProductListingModel.fromJson(response.data);
      } else {
        throw ServerException(
          statusCode: response.statusCode,
          message: response.data['message'] ?? AppErrors.somethingWentWrong,
        );
      }
    });
  }
}
