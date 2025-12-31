import 'package:fpdart/fpdart.dart';

import '../../../../../core/errors/api_exceptions.dart';
import '../../data/models/request/product_add_params.dart';
import '../../data/models/response/product_add_model.dart';

abstract class ProductAddRepository {
  Future<Either<Failure, ProductAddModel>> productAdd(ProductAddParams params);
}
