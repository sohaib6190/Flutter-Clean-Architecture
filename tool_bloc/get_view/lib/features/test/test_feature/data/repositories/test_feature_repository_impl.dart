import 'package:fpdart/fpdart.dart';

import '../../../../../../app/errors/api_exceptions.dart';
import '../../domain/repositories/test_feature_repository.dart';
import '../datasources/remote/test_feature_remote_datasource.dart';
import '../models/request/test_feature_params.dart';
import '../models/response/test_feature_model.dart';

class TestFeatureRepositoryImplementation implements TestFeatureRepository {
  final TestFeatureRemoteDatasource remoteDatasource;

  TestFeatureRepositoryImplementation({required this.remoteDatasource});

  @override
  Future<Either<Failure, TestFeatureModel>> fetchTestFeature(
    TestFeatureParams params,
  ) async {
    try {
      final response = await remoteDatasource.fetchTestFeature(params);
      return right(response);
    } on Failure catch (e) {
      return left(Failure(message: e.message));
    }
  }
}
