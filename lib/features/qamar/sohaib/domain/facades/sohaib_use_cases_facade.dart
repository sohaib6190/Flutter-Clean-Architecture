import 'package:fpdart/fpdart.dart';

import '../../../../../../app/errors/api_exceptions.dart';
import '../../data/models/request/sohaib_params.dart';
import '../../data/models/response/sohaib_model.dart';
import '../usecases/sohaib/sohaib_usecase.dart';

class SohaibUseCasesFacade {
  final SohaibUsecase sohaibUsecase;

  SohaibUseCasesFacade({
    required this.sohaibUsecase,
  });

  Future<Either<Failure, SohaibModel>> fetchSohaib(
    SohaibParams params,
  ) {
    return sohaibUsecase(params);
  }
}
