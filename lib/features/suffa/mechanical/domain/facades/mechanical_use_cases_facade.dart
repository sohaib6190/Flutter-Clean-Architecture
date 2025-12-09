import 'package:fpdart/fpdart.dart';

import '../../../../../../app/errors/api_exceptions.dart';
import '../../data/models/request/mechanical_params.dart';
import '../../data/models/response/mechanical_model.dart';
import '../usecases/mechanical/mechanical_usecase.dart';

class MechanicalUseCasesFacade {
  final MechanicalUsecase mechanicalUsecase;

  MechanicalUseCasesFacade({
    required this.mechanicalUsecase,
  });

  Future<Either<Failure, MechanicalModel>> fetchMechanical(
    MechanicalParams params,
  ) {
    return mechanicalUsecase(params);
  }
}
