import 'package:fpdart/fpdart.dart';

import '../../../../../../app/errors/api_exceptions.dart';
import '../../data/models/request/sohaib_params.dart';
import '../../data/models/response/sohaib_model.dart';

abstract class SohaibRepository {
  Future<Either<Failure, SohaibModel>> fetchSohaib(SohaibParams params);
}
