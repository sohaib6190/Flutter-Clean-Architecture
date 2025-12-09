import 'package:fpdart/fpdart.dart';

import '../../../../../../app/errors/api_exceptions.dart';
import '../../data/models/request/product_params.dart';
import '../../data/models/response/product_model.dart';
import '../usecases/product/product_usecase.dart';

class ProductUseCasesFacade {
  final ProductUsecase productUsecase;

  ProductUseCasesFacade({
    required this.productUsecase,
  });

  Future<Either<Failure, ProductModel>> fetchProduct(
    ProductParams params,
  ) {
    return productUsecase(params);
  }
}
