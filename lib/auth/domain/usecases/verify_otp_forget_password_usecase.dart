import 'dart:async';

import 'package:flutter_clean_architecture/auth/data/models/response/api_response.dart';
import 'package:fpdart/fpdart.dart';

import '../../../core/errors/api_exceptions.dart';
import '../../../core/use_cases/use_case.dart';
import '../../data/models/request/verify_otp_request_model.dart';
import '../repositories/auth_repository.dart';

class VerifyOtpForgetPasswordUsecase
    extends UseCase<ApiResponse<bool>, VerifyOtpRequestModel> {
  final AuthRepository authRepository;

  VerifyOtpForgetPasswordUsecase(this.authRepository);

  @override
  Future<Either<Failure, ApiResponse<bool>>> call(
    VerifyOtpRequestModel params,
  ) async {
    return await authRepository.verifyOtpForForgetPassword(params);
  }
}
