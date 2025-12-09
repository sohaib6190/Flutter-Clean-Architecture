import 'dart:async';

import 'package:fpdart/fpdart.dart';

import '../../../app/errors/api_exceptions.dart';
import '../../../app/use_cases/use_case.dart';
import '../../data/models/request/change_password_request_model.dart';
import '../../data/models/response/api_response.dart';
import '../../data/models/response/change_password_response_model.dart';
import '../repositories/auth_repository.dart';

class ChangePasswordUsecase
    extends
        UseCase<
          ApiResponse<ChangePasswordDataModel>,
          ChangePasswordRequestModel
        > {
  final AuthRepository authRepository;

  ChangePasswordUsecase(this.authRepository);

  @override
  Future<Either<Failure, ApiResponse<ChangePasswordDataModel>>> call(
    ChangePasswordRequestModel params,
  ) async {
    return await authRepository.changePassword(params);
  }
}
