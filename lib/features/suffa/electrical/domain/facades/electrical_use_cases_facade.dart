import 'package:fpdart/fpdart.dart';

import '../../../../../../app/errors/api_exceptions.dart';
import '../../data/models/request/electrical_params.dart';
import '../../data/models/response/electrical_model.dart';
import '../usecases/electrical/electrical_usecase.dart';

class ElectricalUseCasesFacade {
  final ElectricalUsecase electricalUsecase;

  ElectricalUseCasesFacade({
    required this.electricalUsecase,
  });

  Future<Either<Failure, ElectricalModel>> electrical(
    ElectricalParams params,
  ) {
    return electricalUsecase(params);
  }
}
