import 'package:fpdart/fpdart.dart';

import '../../../../../../../app/errors/api_exceptions.dart';
import '../../../../../../../app/use_cases/use_case.dart';
import '../../../data/models/request/electrical_params.dart';
import '../../../data/models/response/electrical_model.dart';
import '../../repositories/electrical_repository.dart';

class ElectricalUsecase extends UseCase<ElectricalModel, ElectricalParams> {
  final ElectricalRepository repository;

  ElectricalUsecase(this.repository);

  @override
  Future<Either<Failure, ElectricalModel>> call(
    ElectricalParams params,
  ) async {
    return repository.electrical(params);
  }
}
