import 'package:fpdart/fpdart.dart';

import '../../../../../../../app/errors/api_exceptions.dart';
import '../../../../../../../app/use_cases/use_case.dart';
import '../../../data/models/request/jack_params.dart';
import '../../../data/models/response/jack_model.dart';
import '../../repositories/jack_repository.dart';

class FetchJackUsecase extends UseCase<JackModel, JackParams> {
  final JackRepository repository;

  FetchJackUsecase(this.repository);

  @override
  Future<Either<Failure, JackModel>> call(
    JackParams params,
  ) async {
    return repository.fetchJack(params);
  }
}
