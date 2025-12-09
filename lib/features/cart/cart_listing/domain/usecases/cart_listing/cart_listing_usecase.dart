import 'package:fpdart/fpdart.dart';

import '../../../../../../../app/errors/api_exceptions.dart';
import '../../../../../../../app/use_cases/use_case.dart';
import '../../../data/models/request/cart_listing_params.dart';
import '../../../data/models/response/cart_listing_model.dart';
import '../../repositories/cart_listing_repository.dart';

class CartListingUsecase extends UseCase<CartListingModel, CartListingParams> {
  final CartListingRepository repository;

  CartListingUsecase(this.repository);

  @override
  Future<Either<Failure, CartListingModel>> call(
    CartListingParams params,
  ) async {
    return repository.fetchCartListing(params);
  }
}
