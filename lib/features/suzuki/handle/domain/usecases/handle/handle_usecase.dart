import 'package:fpdart/fpdart.dart';

import '../../../../../../../app/errors/api_exceptions.dart';
import '../../../../../../../app/use_cases/use_case.dart';
import '../../../data/models/request/handle_params.dart';
import '../../../data/models/response/handle_model.dart';
import '../../repositories/handle_repository.dart';

class HandleUsecase extends UseCase<HandleModel, HandleParams> {
  final HandleRepository repository;

  HandleUsecase(this.repository);

  @override
  Future<Either<Failure, HandleModel>> call(
    HandleParams params,
  ) async {
    return repository.handle(params);
  }
}
