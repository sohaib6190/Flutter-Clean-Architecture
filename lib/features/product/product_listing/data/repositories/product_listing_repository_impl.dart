import 'package:fpdart/fpdart.dart';

import '../../../../../../app/errors/api_exceptions.dart';
import '../../domain/repositories/product_listing_repository.dart';
import '../datasources/remote/product_listing_remote_datasource.dart';
import '../models/request/product_listing_params.dart';
import '../models/response/product_listing_model.dart';

class ProductListingRepositoryImplementation implements ProductListingRepository {
  final ProductListingRemoteDatasource remoteDatasource;

  ProductListingRepositoryImplementation({required this.remoteDatasource});

  @override
  Future<Either<Failure, ProductListingModel>> fetchProductListing(
    ProductListingParams params,
  ) async {
    try {
      final response = await remoteDatasource.fetchProductListing(params);
      return right(response);
    } on Failure catch (e) {
      return left(Failure(message: e.message));
    }
  }
}
