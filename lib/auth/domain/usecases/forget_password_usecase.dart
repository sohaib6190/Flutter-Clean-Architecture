import 'dart:async';

import 'package:fpdart/fpdart.dart';

import '../../../core/errors/api_exceptions.dart';
import '../../../core/use_cases/use_case.dart';
import '../../data/models/request/forget_password_request_model.dart';
import '../../data/models/response/api_response.dart';
import '../repositories/auth_repository.dart';

class ForgetPasswordUsecase
    extends UseCase<ApiResponse<bool>, ForgetPasswordRequestModel> {
  final AuthRepository authRepository;

  ForgetPasswordUsecase(this.authRepository);

  @override
  Future<Either<Failure, ApiResponse<bool>>> call(
    ForgetPasswordRequestModel params,
  ) async {
    return await authRepository.forgetPassword(params);
  }
}
