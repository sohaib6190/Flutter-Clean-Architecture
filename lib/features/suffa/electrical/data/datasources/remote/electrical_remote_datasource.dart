import '../../models/request/electrical_params.dart';
import '../../models/response/electrical_model.dart';

abstract class ElectricalRemoteDatasource {
  ElectricalRemoteDatasource();

  Future<ElectricalModel> electrical(ElectricalParams params);
}
