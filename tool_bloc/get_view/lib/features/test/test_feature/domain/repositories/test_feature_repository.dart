import 'package:fpdart/fpdart.dart';

import '../../../../../../app/errors/api_exceptions.dart';
import '../../data/models/request/test_feature_params.dart';
import '../../data/models/response/test_feature_model.dart';

abstract class TestFeatureRepository {
  Future<Either<Failure, TestFeatureModel>> fetchTestFeature(TestFeatureParams params);
}
