import 'package:fpdart/fpdart.dart';

import '../../../../../../app/errors/api_exceptions.dart';
import '../../data/models/request/cs_params.dart';
import '../../data/models/response/cs_model.dart';

abstract class CsRepository {
  Future<Either<Failure, CsModel>> fetchCs(CsParams params);
}
