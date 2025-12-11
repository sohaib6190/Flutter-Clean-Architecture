import 'package:fpdart/fpdart.dart';

import '../../../../../../../app/errors/api_exceptions.dart';
import '../../../../../../../app/use_cases/use_case.dart';
import '../../../data/models/request/product_listing_params.dart';
import '../../../data/models/response/product_listing_model.dart';
import '../../repositories/product_listing_repository.dart';

class ProductListingUsecase extends UseCase<ProductListingModel, ProductListingParams> {
  final ProductListingRepository repository;

  ProductListingUsecase(this.repository);

  @override
  Future<Either<Failure, ProductListingModel>> call(
    ProductListingParams params,
  ) async {
    return repository.fetchProductListing(params);
  }
}
