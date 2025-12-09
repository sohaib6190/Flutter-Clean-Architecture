import 'package:fpdart/fpdart.dart';

import '../../../../../../app/errors/api_exceptions.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/remote/product_remote_datasource.dart';
import '../models/request/product_params.dart';
import '../models/response/product_model.dart';

class ProductRepositoryImplementation implements ProductRepository {
  final ProductRemoteDatasource remoteDatasource;

  ProductRepositoryImplementation({required this.remoteDatasource});

  @override
  Future<Either<Failure, ProductModel>> fetchProduct(
    ProductParams params,
  ) async {
    try {
      final response = await remoteDatasource.fetchProduct(params);
      return right(response);
    } on Failure catch (e) {
      return left(Failure(message: e.message));
    }
  }
}
