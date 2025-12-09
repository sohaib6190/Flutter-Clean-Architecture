import 'package:fpdart/fpdart.dart';

import '../../../../../../app/errors/api_exceptions.dart';
import '../../data/models/request/electrical_params.dart';
import '../../data/models/response/electrical_model.dart';

abstract class ElectricalRepository {
  Future<Either<Failure, ElectricalModel>> electrical(ElectricalParams params);
}
