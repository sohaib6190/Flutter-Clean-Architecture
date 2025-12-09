import 'package:fpdart/fpdart.dart';

import '../../../../../../../app/errors/api_exceptions.dart';
import '../../../../../../../app/use_cases/use_case.dart';
import '../../../data/models/request/test_feature_params.dart';
import '../../../data/models/response/test_feature_model.dart';
import '../../repositories/test_feature_repository.dart';

class TestFeatureUsecase extends UseCase<TestFeatureModel, TestFeatureParams> {
  final TestFeatureRepository repository;

  TestFeatureUsecase(this.repository);

  @override
  Future<Either<Failure, TestFeatureModel>> call(
    TestFeatureParams params,
  ) async {
    return repository.fetchTestFeature(params);
  }
}
