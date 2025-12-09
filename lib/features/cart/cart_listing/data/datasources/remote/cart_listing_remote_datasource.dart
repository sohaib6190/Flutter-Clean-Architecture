import '../../models/request/cart_listing_params.dart';
import '../../models/response/cart_listing_model.dart';

abstract class CartListingRemoteDatasource {
  CartListingRemoteDatasource();

  Future<CartListingModel> fetchCartListing(CartListingParams params);
}
