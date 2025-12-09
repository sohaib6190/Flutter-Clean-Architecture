import 'package:fpdart/fpdart.dart';

import '../../../../../../app/errors/api_exceptions.dart';
import '../../domain/repositories/mechanical_repository.dart';
import '../datasources/remote/mechanical_remote_datasource.dart';
import '../models/request/mechanical_params.dart';
import '../models/response/mechanical_model.dart';

class MechanicalRepositoryImplementation implements MechanicalRepository {
  final MechanicalRemoteDatasource remoteDatasource;

  MechanicalRepositoryImplementation({required this.remoteDatasource});

  @override
  Future<Either<Failure, MechanicalModel>> fetchMechanical(
    MechanicalParams params,
  ) async {
    try {
      final response = await remoteDatasource.fetchMechanical(params);
      return right(response);
    } on Failure catch (e) {
      return left(Failure(message: e.message));
    }
  }
}
