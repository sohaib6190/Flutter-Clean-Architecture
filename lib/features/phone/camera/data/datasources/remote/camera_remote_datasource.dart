import '../../models/request/camera_params.dart';
import '../../models/response/camera_model.dart';

abstract class CameraRemoteDatasource {
  CameraRemoteDatasource();

  Future<CameraModel> fetchCamera(CameraParams params);
  Future<CameraModel> camera(CameraParams params);
}
