import 'package:fpdart/fpdart.dart';

import '../../../../../../app/errors/api_exceptions.dart';
import '../../data/models/request/cart_listing_params.dart';
import '../../data/models/response/cart_listing_model.dart';

abstract class CartListingRepository {
  Future<Either<Failure, CartListingModel>> fetchCartListing(CartListingParams params);
}
