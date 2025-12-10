import 'package:fpdart/fpdart.dart';

import '../../../../../../app/errors/api_exceptions.dart';
import '../../data/models/request/jack_params.dart';
import '../../data/models/response/jack_model.dart';

abstract class JackRepository {
  Future<Either<Failure, JackModel>> fetchJack(JackParams params);
  Future<Either<Failure, JackModel>> jack(JackParams params);
}
