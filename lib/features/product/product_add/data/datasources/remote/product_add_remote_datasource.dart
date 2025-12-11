import '../../models/request/product_add_params.dart';
import '../../models/response/product_add_model.dart';

abstract class ProductAddRemoteDatasource {
  ProductAddRemoteDatasource();

  Future<ProductAddModel> productAdd(ProductAddParams params);
}
