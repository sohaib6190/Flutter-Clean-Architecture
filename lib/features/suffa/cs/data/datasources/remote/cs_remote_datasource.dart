import '../../models/request/cs_params.dart';
import '../../models/response/cs_model.dart';

abstract class CsRemoteDatasource {
  CsRemoteDatasource();

  Future<CsModel> fetchCs(CsParams params);
}
