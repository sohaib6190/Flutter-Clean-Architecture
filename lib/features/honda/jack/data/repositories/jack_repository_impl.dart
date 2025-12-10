import 'package:fpdart/fpdart.dart';

import '../../../../../../app/errors/api_exceptions.dart';
import '../../domain/repositories/jack_repository.dart';
import '../datasources/remote/jack_remote_datasource.dart';
import '../models/request/jack_params.dart';
import '../models/response/jack_model.dart';

class JackRepositoryImplementation implements JackRepository {
  final JackRemoteDatasource remoteDatasource;

  JackRepositoryImplementation({required this.remoteDatasource});

  @override
  Future<Either<Failure, JackModel>> fetchJack(
    JackParams params,
  ) async {
    try {
      final response = await remoteDatasource.fetchJack(params);
      return right(response);
    } on Failure catch (e) {
      return left(Failure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, JackModel>> jack(
    JackParams params,
  ) async {
    try {
      final response = await remoteDatasource.jack(params);
      return right(response);
    } on Failure catch (e) {
      return left(Failure(message: e.message));
    }
  }
}
