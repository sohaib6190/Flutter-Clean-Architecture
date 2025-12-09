import 'package:fpdart/fpdart.dart';

import '../../../../../../app/errors/api_exceptions.dart';
import '../../data/models/request/mechanical_params.dart';
import '../../data/models/response/mechanical_model.dart';

abstract class MechanicalRepository {
  Future<Either<Failure, MechanicalModel>> fetchMechanical(MechanicalParams params);
}
