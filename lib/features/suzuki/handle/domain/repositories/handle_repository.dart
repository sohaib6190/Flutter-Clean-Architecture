import 'package:fpdart/fpdart.dart';

import '../../../../../../app/errors/api_exceptions.dart';
import '../../data/models/request/handle_params.dart';
import '../../data/models/response/handle_model.dart';

abstract class HandleRepository {
  Future<Either<Failure, HandleModel>> fetchHandle(HandleParams params);
  Future<Either<Failure, HandleModel>> handle(HandleParams params);
}
