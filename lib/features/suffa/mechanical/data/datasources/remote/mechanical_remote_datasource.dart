import '../../models/request/mechanical_params.dart';
import '../../models/response/mechanical_model.dart';

abstract class MechanicalRemoteDatasource {
  MechanicalRemoteDatasource();

  Future<MechanicalModel> fetchMechanical(MechanicalParams params);
}
