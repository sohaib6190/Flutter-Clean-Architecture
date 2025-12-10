import '../../models/request/handle_params.dart';
import '../../models/response/handle_model.dart';

abstract class HandleRemoteDatasource {
  HandleRemoteDatasource();

  Future<HandleModel> fetchHandle(HandleParams params);
  Future<HandleModel> handle(HandleParams params);
}
