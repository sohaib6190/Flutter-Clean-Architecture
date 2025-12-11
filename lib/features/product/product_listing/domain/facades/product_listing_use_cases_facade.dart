import 'package:fpdart/fpdart.dart';

import '../../../../../../app/errors/api_exceptions.dart';
import '../../data/models/request/product_listing_params.dart';
import '../../data/models/response/product_listing_model.dart';
import '../usecases/product_listing/product_listing_usecase.dart';

class ProductListingUseCasesFacade {
  final ProductListingUsecase productListingUsecase;

  ProductListingUseCasesFacade({
    required this.productListingUsecase,
  });

  Future<Either<Failure, ProductListingModel>> fetchProductListing(
    ProductListingParams params,
  ) {
    return productListingUsecase(params);
  }
}
