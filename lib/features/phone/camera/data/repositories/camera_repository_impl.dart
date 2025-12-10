import 'package:fpdart/fpdart.dart';

import '../../../../../../app/errors/api_exceptions.dart';
import '../../domain/repositories/camera_repository.dart';
import '../datasources/remote/camera_remote_datasource.dart';
import '../models/request/camera_params.dart';
import '../models/response/camera_model.dart';

class CameraRepositoryImplementation implements CameraRepository {
  final CameraRemoteDatasource remoteDatasource;

  CameraRepositoryImplementation({required this.remoteDatasource});

  @override
  Future<Either<Failure, CameraModel>> fetchCamera(
    CameraParams params,
  ) async {
    try {
      final response = await remoteDatasource.fetchCamera(params);
      return right(response);
    } on Failure catch (e) {
      return left(Failure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, CameraModel>> camera(
    CameraParams params,
  ) async {
    try {
      final response = await remoteDatasource.camera(params);
      return right(response);
    } on Failure catch (e) {
      return left(Failure(message: e.message));
    }
  }
}
