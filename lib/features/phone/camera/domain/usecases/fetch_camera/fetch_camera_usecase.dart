import 'package:fpdart/fpdart.dart';

import '../../../../../../../app/errors/api_exceptions.dart';
import '../../../../../../../app/use_cases/use_case.dart';
import '../../../data/models/request/camera_params.dart';
import '../../../data/models/response/camera_model.dart';
import '../../repositories/camera_repository.dart';

class FetchCameraUsecase extends UseCase<CameraModel, CameraParams> {
  final CameraRepository repository;

  FetchCameraUsecase(this.repository);

  @override
  Future<Either<Failure, CameraModel>> call(
    CameraParams params,
  ) async {
    return repository.fetchCamera(params);
  }
}
