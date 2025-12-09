import 'package:fpdart/fpdart.dart';

import '../../../../../../../app/errors/api_exceptions.dart';
import '../../../../../../../app/use_cases/use_case.dart';
import '../../../data/models/request/sohaib_params.dart';
import '../../../data/models/response/sohaib_model.dart';
import '../../repositories/sohaib_repository.dart';

class SohaibUsecase extends UseCase<SohaibModel, SohaibParams> {
  final SohaibRepository repository;

  SohaibUsecase(this.repository);

  @override
  Future<Either<Failure, SohaibModel>> call(
    SohaibParams params,
  ) async {
    return repository.fetchSohaib(params);
  }
}
