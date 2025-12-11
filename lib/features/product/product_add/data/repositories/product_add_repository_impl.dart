import 'package:fpdart/fpdart.dart';

import '../../../../../../app/errors/api_exceptions.dart';
import '../../domain/repositories/product_add_repository.dart';
import '../datasources/remote/product_add_remote_datasource.dart';
import '../models/request/product_add_params.dart';
import '../models/response/product_add_model.dart';

class ProductAddRepositoryImplementation implements ProductAddRepository {
  final ProductAddRemoteDatasource remoteDatasource;

  ProductAddRepositoryImplementation({required this.remoteDatasource});

  @override
  Future<Either<Failure, ProductAddModel>> productAdd(
    ProductAddParams params,
  ) async {
    try {
      final response = await remoteDatasource.productAdd(params);
      return right(response);
    } on Failure catch (e) {
      return left(Failure(message: e.message));
    }
  }
}
