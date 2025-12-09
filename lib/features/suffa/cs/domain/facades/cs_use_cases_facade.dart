import 'package:fpdart/fpdart.dart';

import '../../../../../../app/errors/api_exceptions.dart';
import '../../data/models/request/cs_params.dart';
import '../../data/models/response/cs_model.dart';
import '../usecases/cs/cs_usecase.dart';

class CsUseCasesFacade {
  final CsUsecase csUsecase;

  CsUseCasesFacade({
    required this.csUsecase,
  });

  Future<Either<Failure, CsModel>> fetchCs(
    CsParams params,
  ) {
    return csUsecase(params);
  }
}
