import 'package:fpdart/fpdart.dart';

import '../../../../../../../app/errors/api_exceptions.dart';
import '../../../../../../../app/use_cases/use_case.dart';
import '../../../data/models/request/product_add_params.dart';
import '../../../data/models/response/product_add_model.dart';
import '../../repositories/product_add_repository.dart';

class ProductAddUsecase extends UseCase<ProductAddModel, ProductAddParams> {
  final ProductAddRepository repository;

  ProductAddUsecase(this.repository);

  @override
  Future<Either<Failure, ProductAddModel>> call(
    ProductAddParams params,
  ) async {
    return repository.productAdd(params);
  }
}
