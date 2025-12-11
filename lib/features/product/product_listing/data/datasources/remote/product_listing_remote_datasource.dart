import '../../models/request/product_listing_params.dart';
import '../../models/response/product_listing_model.dart';

abstract class ProductListingRemoteDatasource {
  ProductListingRemoteDatasource();

  Future<ProductListingModel> fetchProductListing(ProductListingParams params);
}
