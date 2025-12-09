import 'package:fpdart/fpdart.dart';

import '../../../../../../app/errors/api_exceptions.dart';
import '../../domain/repositories/electrical_repository.dart';
import '../datasources/remote/electrical_remote_datasource.dart';
import '../models/request/electrical_params.dart';
import '../models/response/electrical_model.dart';

class ElectricalRepositoryImplementation implements ElectricalRepository {
  final ElectricalRemoteDatasource remoteDatasource;

  ElectricalRepositoryImplementation({required this.remoteDatasource});

  @override
  Future<Either<Failure, ElectricalModel>> electrical(
    ElectricalParams params,
  ) async {
    try {
      final response = await remoteDatasource.electrical(params);
      return right(response);
    } on Failure catch (e) {
      return left(Failure(message: e.message));
    }
  }
}
