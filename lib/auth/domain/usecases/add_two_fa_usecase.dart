import 'dart:async';

import 'package:fpdart/fpdart.dart';

import '../../../app/errors/api_exceptions.dart';
import '../../../app/use_cases/use_case.dart';
import '../../data/models/request/two_fa_request_model.dart';
import '../../data/models/response/api_response.dart';
import '../repositories/auth_repository.dart';

class Add2FAUseCase
    extends UseCase<ApiResponse<bool>, TwoFactorAuthenticationRequestModel> {
  final AuthRepository authRepository;

  Add2FAUseCase(this.authRepository);

  @override
  Future<Either<Failure, ApiResponse<bool>>> call(
    TwoFactorAuthenticationRequestModel params,
  ) async {
    return await authRepository.add2FA(params);
  }
}
