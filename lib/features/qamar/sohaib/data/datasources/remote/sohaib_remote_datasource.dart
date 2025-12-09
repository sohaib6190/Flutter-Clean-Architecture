import '../../models/request/sohaib_params.dart';
import '../../models/response/sohaib_model.dart';

abstract class SohaibRemoteDatasource {
  SohaibRemoteDatasource();

  Future<SohaibModel> fetchSohaib(SohaibParams params);
}
