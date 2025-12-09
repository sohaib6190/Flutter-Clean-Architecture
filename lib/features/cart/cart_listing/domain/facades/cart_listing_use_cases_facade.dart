import 'package:fpdart/fpdart.dart';

import '../../../../../../app/errors/api_exceptions.dart';
import '../../data/models/request/cart_listing_params.dart';
import '../../data/models/response/cart_listing_model.dart';
import '../usecases/cart_listing/cart_listing_usecase.dart';

class CartListingUseCasesFacade {
  final CartListingUsecase cartListingUsecase;

  CartListingUseCasesFacade({
    required this.cartListingUsecase,
  });

  Future<Either<Failure, CartListingModel>> fetchCartListing(
    CartListingParams params,
  ) {
    return cartListingUsecase(params);
  }
}
