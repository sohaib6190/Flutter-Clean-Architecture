import 'package:fpdart/fpdart.dart';

import '../../../../../../app/errors/api_exceptions.dart';
import '../../data/models/request/product_params.dart';
import '../../data/models/response/product_model.dart';

abstract class ProductRepository {
  Future<Either<Failure, ProductModel>> fetchProduct(ProductParams params);
}
