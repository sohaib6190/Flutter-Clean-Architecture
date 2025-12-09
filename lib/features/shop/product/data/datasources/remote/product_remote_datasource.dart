import '../../models/request/product_params.dart';
import '../../models/response/product_model.dart';

abstract class ProductRemoteDatasource {
  ProductRemoteDatasource();

  Future<ProductModel> fetchProduct(ProductParams params);
}
