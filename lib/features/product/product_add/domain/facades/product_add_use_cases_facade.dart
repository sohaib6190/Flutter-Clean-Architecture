import 'package:fpdart/fpdart.dart';

import '../../../../../../app/errors/api_exceptions.dart';
import '../../data/models/request/product_add_params.dart';
import '../../data/models/response/product_add_model.dart';
import '../usecases/product_add/product_add_usecase.dart';

class ProductAddUseCasesFacade {
  final ProductAddUsecase productAddUsecase;

  ProductAddUseCasesFacade({
    required this.productAddUsecase,
  });

  Future<Either<Failure, ProductAddModel>> productAdd(
    ProductAddParams params,
  ) {
    return productAddUsecase(params);
  }
}
