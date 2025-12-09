import 'package:fpdart/fpdart.dart';

import '../../../../../../app/errors/api_exceptions.dart';
import '../../domain/repositories/cart_listing_repository.dart';
import '../datasources/remote/cart_listing_remote_datasource.dart';
import '../models/request/cart_listing_params.dart';
import '../models/response/cart_listing_model.dart';

class CartListingRepositoryImplementation implements CartListingRepository {
  final CartListingRemoteDatasource remoteDatasource;

  CartListingRepositoryImplementation({required this.remoteDatasource});

  @override
  Future<Either<Failure, CartListingModel>> fetchCartListing(
    CartListingParams params,
  ) async {
    try {
      final response = await remoteDatasource.fetchCartListing(params);
      return right(response);
    } on Failure catch (e) {
      return left(Failure(message: e.message));
    }
  }
}
