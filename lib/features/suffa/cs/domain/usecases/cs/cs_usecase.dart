import 'package:fpdart/fpdart.dart';

import '../../../../../../../app/errors/api_exceptions.dart';
import '../../../../../../../app/use_cases/use_case.dart';
import '../../../data/models/request/cs_params.dart';
import '../../../data/models/response/cs_model.dart';
import '../../repositories/cs_repository.dart';

class CsUsecase extends UseCase<CsModel, CsParams> {
  final CsRepository repository;

  CsUsecase(this.repository);

  @override
  Future<Either<Failure, CsModel>> call(
    CsParams params,
  ) async {
    return repository.fetchCs(params);
  }
}
