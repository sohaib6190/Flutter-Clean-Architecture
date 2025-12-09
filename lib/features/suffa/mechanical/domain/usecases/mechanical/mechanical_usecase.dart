import 'package:fpdart/fpdart.dart';

import '../../../../../../../app/errors/api_exceptions.dart';
import '../../../../../../../app/use_cases/use_case.dart';
import '../../../data/models/request/mechanical_params.dart';
import '../../../data/models/response/mechanical_model.dart';
import '../../repositories/mechanical_repository.dart';

class MechanicalUsecase extends UseCase<MechanicalModel, MechanicalParams> {
  final MechanicalRepository repository;

  MechanicalUsecase(this.repository);

  @override
  Future<Either<Failure, MechanicalModel>> call(
    MechanicalParams params,
  ) async {
    return repository.fetchMechanical(params);
  }
}
