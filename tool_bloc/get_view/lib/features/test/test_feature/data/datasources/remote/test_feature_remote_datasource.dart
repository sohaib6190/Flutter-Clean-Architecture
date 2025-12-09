import '../../models/request/test_feature_params.dart';
import '../../models/response/test_feature_model.dart';

abstract class TestFeatureRemoteDatasource {
  TestFeatureRemoteDatasource();

  Future<TestFeatureModel> fetchTestFeature(TestFeatureParams params);
}
