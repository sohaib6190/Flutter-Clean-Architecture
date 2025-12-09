import 'package:fpdart/fpdart.dart';

import '../../../../../../app/errors/api_exceptions.dart';
import '../../domain/repositories/sohaib_repository.dart';
import '../datasources/remote/sohaib_remote_datasource.dart';
import '../models/request/sohaib_params.dart';
import '../models/response/sohaib_model.dart';

class SohaibRepositoryImplementation implements SohaibRepository {
  final SohaibRemoteDatasource remoteDatasource;

  SohaibRepositoryImplementation({required this.remoteDatasource});

  @override
  Future<Either<Failure, SohaibModel>> fetchSohaib(
    SohaibParams params,
  ) async {
    try {
      final response = await remoteDatasource.fetchSohaib(params);
      return right(response);
    } on Failure catch (e) {
      return left(Failure(message: e.message));
    }
  }
}
