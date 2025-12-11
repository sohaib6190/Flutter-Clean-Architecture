import 'package:fpdart/fpdart.dart';

import '../../../../../../app/errors/api_exceptions.dart';
import '../../data/models/request/product_listing_params.dart';
import '../../data/models/response/product_listing_model.dart';

abstract class ProductListingRepository {
  Future<Either<Failure, ProductListingModel>> fetchProductListing(ProductListingParams params);
}
