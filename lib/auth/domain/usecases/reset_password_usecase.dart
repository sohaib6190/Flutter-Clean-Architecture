import 'dart:async';

import 'package:fpdart/fpdart.dart';

import '../../../app/errors/api_exceptions.dart';
import '../../../app/use_cases/use_case.dart';
import '../../data/models/request/reset_password_request_model.dart';
import '../../data/models/response/api_response.dart';
import '../repositories/auth_repository.dart';

class ResetPasswordUsecase
    extends UseCase<ApiResponse<bool>, ResetPasswordRequestModel> {
  final AuthRepository authRepository;

  ResetPasswordUsecase(this.authRepository);

  @override
  Future<Either<Failure, ApiResponse<bool>>> call(
    ResetPasswordRequestModel params,
  ) async {
    return await authRepository.resetPassword(params);
  }
}
