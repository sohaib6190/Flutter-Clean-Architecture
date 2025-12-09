import 'dart:developer';

import '../../../../../../app/constants/app_errors.dart';
import '../../../../../../app/errors/api_exceptions.dart';
import '../../../../../../app/network/client/dio_client.dart';
import '../../../../../../app/network/config/api_endpoints.dart';
import '../../../../../../app/network/config/error_handler.dart';
import '../../models/request/cart_listing_params.dart';
import '../../models/response/cart_listing_model.dart';
import 'cart_listing_remote_datasource.dart';

class CartListingRemoteDatasourceImplementation implements CartListingRemoteDatasource {
  final DioClient client;
  
  CartListingRemoteDatasourceImplementation({required this.client});

  @override
  Future<CartListingModel> fetchCartListing(CartListingParams params) async {
    log("Params is $params");
    return ApiErrorHandler.executeGuarded(() async {
      final response = await client.get(
        endpoint: ApiEndpoints.signup.value,
        queryParams: params.toJson(),
      );
      if (response.statusCode == 200) {
        return CartListingModel.fromJson(response.data);
      } else {
        throw ServerException(
          statusCode: response.statusCode,
          message: response.data['message'] ?? AppErrors.somethingWentWrong,
        );
      }
    });
  }
}
