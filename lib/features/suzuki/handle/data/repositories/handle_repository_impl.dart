import 'package:fpdart/fpdart.dart';

import '../../../../../../app/errors/api_exceptions.dart';
import '../../domain/repositories/handle_repository.dart';
import '../datasources/remote/handle_remote_datasource.dart';
import '../models/request/handle_params.dart';
import '../models/response/handle_model.dart';

class HandleRepositoryImplementation implements HandleRepository {
  final HandleRemoteDatasource remoteDatasource;

  HandleRepositoryImplementation({required this.remoteDatasource});

  @override
  Future<Either<Failure, HandleModel>> fetchHandle(
    HandleParams params,
  ) async {
    try {
      final response = await remoteDatasource.fetchHandle(params);
      return right(response);
    } on Failure catch (e) {
      return left(Failure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, HandleModel>> handle(
    HandleParams params,
  ) async {
    try {
      final response = await remoteDatasource.handle(params);
      return right(response);
    } on Failure catch (e) {
      return left(Failure(message: e.message));
    }
  }
}
