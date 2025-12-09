import 'package:fpdart/fpdart.dart';

import '../../../../../../app/errors/api_exceptions.dart';
import '../../domain/repositories/cs_repository.dart';
import '../datasources/remote/cs_remote_datasource.dart';
import '../models/request/cs_params.dart';
import '../models/response/cs_model.dart';

class CsRepositoryImplementation implements CsRepository {
  final CsRemoteDatasource remoteDatasource;

  CsRepositoryImplementation({required this.remoteDatasource});

  @override
  Future<Either<Failure, CsModel>> fetchCs(
    CsParams params,
  ) async {
    try {
      final response = await remoteDatasource.fetchCs(params);
      return right(response);
    } on Failure catch (e) {
      return left(Failure(message: e.message));
    }
  }
}
