import 'package:fpdart/fpdart.dart';

import '../../../../../../app/errors/api_exceptions.dart';
import '../../data/models/request/camera_params.dart';
import '../../data/models/response/camera_model.dart';

abstract class CameraRepository {
  Future<Either<Failure, CameraModel>> fetchCamera(CameraParams params);
  Future<Either<Failure, CameraModel>> camera(CameraParams params);
}
