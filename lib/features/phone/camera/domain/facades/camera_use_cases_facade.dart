import 'package:fpdart/fpdart.dart';

import '../../../../../../app/errors/api_exceptions.dart';
import '../../data/models/request/camera_params.dart';
import '../../data/models/response/camera_model.dart';
import '../usecases/fetch_camera/fetch_camera_usecase.dart';
import '../usecases/camera/camera_usecase.dart';

class CameraUseCasesFacade {
  final FetchCameraUsecase fetchCameraUsecase;
  final CameraUsecase cameraUsecase;

  CameraUseCasesFacade({
    required this.fetchCameraUsecase,
    required this.cameraUsecase,
  });

  Future<Either<Failure, CameraModel>> fetchCamera(
    CameraParams params,
  ) {
    return fetchCameraUsecase(params);
  }

  Future<Either<Failure, CameraModel>> camera(
    CameraParams params,
  ) {
    return cameraUsecase(params);
  }
}
