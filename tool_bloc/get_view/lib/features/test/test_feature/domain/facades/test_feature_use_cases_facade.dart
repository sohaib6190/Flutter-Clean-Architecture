import 'package:fpdart/fpdart.dart';

import '../../../../../../app/errors/api_exceptions.dart';
import '../../data/models/request/test_feature_params.dart';
import '../../data/models/response/test_feature_model.dart';
import '../usecases/test_feature/test_feature_usecase.dart';

class TestFeatureUseCasesFacade {
  final TestFeatureUsecase testFeatureUsecase;

  TestFeatureUseCasesFacade({
    required this.testFeatureUsecase,
  });

  Future<Either<Failure, TestFeatureModel>> fetchTestFeature(
    TestFeatureParams params,
  ) {
    return testFeatureUsecase(params);
  }
}
