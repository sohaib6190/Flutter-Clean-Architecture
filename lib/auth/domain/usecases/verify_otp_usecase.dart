import 'dart:async';

import 'package:fpdart/fpdart.dart';

import '../../../app/errors/api_exceptions.dart';
import '../../../app/use_cases/use_case.dart';
import '../../data/models/request/two_fa_request_model.dart';
import '../../data/models/response/api_response.dart';
import '../../data/models/response/otp_verification_status.dart';
import '../repositories/auth_repository.dart';

class VerifyOtpUseCase
    extends
        UseCase<
          ApiResponse<OtpVerificationStatus>,
          TwoFactorAuthenticationRequestModel
        > {
  final AuthRepository authRepository;

  VerifyOtpUseCase(this.authRepository);

  @override
  Future<Either<Failure, ApiResponse<OtpVerificationStatus>>> call(
    TwoFactorAuthenticationRequestModel params,
  ) async {
    return await authRepository.verifyOtp(params);
  }
}
