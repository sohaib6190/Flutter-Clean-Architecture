import '../../models/request/jack_params.dart';
import '../../models/response/jack_model.dart';

abstract class JackRemoteDatasource {
  JackRemoteDatasource();

  Future<JackModel> fetchJack(JackParams params);
  Future<JackModel> jack(JackParams params);
}
