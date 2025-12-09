import 'package:fpdart/fpdart.dart';

import '../../../../../../../app/errors/api_exceptions.dart';
import '../../../../../../../app/use_cases/use_case.dart';
import '../../../data/models/request/product_params.dart';
import '../../../data/models/response/product_model.dart';
import '../../repositories/product_repository.dart';

class ProductUsecase extends UseCase<ProductModel, ProductParams> {
  final ProductRepository repository;

  ProductUsecase(this.repository);

  @override
  Future<Either<Failure, ProductModel>> call(
    ProductParams params,
  ) async {
    return repository.fetchProduct(params);
  }
}
