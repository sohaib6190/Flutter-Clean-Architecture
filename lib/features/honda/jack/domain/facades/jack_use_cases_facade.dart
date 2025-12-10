import 'package:fpdart/fpdart.dart';

import '../../../../../../app/errors/api_exceptions.dart';
import '../../data/models/request/jack_params.dart';
import '../../data/models/response/jack_model.dart';
import '../usecases/fetch_jack/fetch_jack_usecase.dart';
import '../usecases/jack/jack_usecase.dart';

class JackUseCasesFacade {
  final FetchJackUsecase fetchJackUsecase;
  final JackUsecase jackUsecase;

  JackUseCasesFacade({
    required this.fetchJackUsecase,
    required this.jackUsecase,
  });

  Future<Either<Failure, JackModel>> fetchJack(
    JackParams params,
  ) {
    return fetchJackUsecase(params);
  }

  Future<Either<Failure, JackModel>> jack(
    JackParams params,
  ) {
    return jackUsecase(params);
  }
}
