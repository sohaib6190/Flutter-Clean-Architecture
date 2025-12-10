import 'package:fpdart/fpdart.dart';

import '../../../../../../app/errors/api_exceptions.dart';
import '../../data/models/request/handle_params.dart';
import '../../data/models/response/handle_model.dart';
import '../usecases/fetch_handle/fetch_handle_usecase.dart';
import '../usecases/handle/handle_usecase.dart';

class HandleUseCasesFacade {
  final FetchHandleUsecase fetchHandleUsecase;
  final HandleUsecase handleUsecase;

  HandleUseCasesFacade({
    required this.fetchHandleUsecase,
    required this.handleUsecase,
  });

  Future<Either<Failure, HandleModel>> fetchHandle(
    HandleParams params,
  ) {
    return fetchHandleUsecase(params);
  }

  Future<Either<Failure, HandleModel>> handle(
    HandleParams params,
  ) {
    return handleUsecase(params);
  }
}
