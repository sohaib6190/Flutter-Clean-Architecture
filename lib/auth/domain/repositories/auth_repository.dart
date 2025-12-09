import 'package:fpdart/fpdart.dart';

import '../../../app/errors/api_exceptions.dart';
import '../../data/models/request/change_password_request_model.dart';
import '../../data/models/request/forget_password_request_model.dart';
import '../../data/models/request/login_request_model.dart';
import '../../data/models/request/reset_password_request_model.dart';
import '../../data/models/request/signup_request_model.dart';
import '../../data/models/request/two_fa_request_model.dart';
import '../../data/models/request/verify_otp_request_model.dart';
import '../../data/models/response/api_response.dart';
import '../../data/models/response/change_password_response_model.dart';
import '../../data/models/response/get_secret_key_response_model.dart';
import '../../data/models/response/otp_verification_status.dart';
import '../entities/user_entity.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, UserEntity>> login({
    required LoginRequestModel params,
  });

  Future<Either<Failure, UserEntity>> signUp({
    required SignupRequestModel params,
  });

  Future<Either<Failure, bool>> logout();
  Future<Either<Failure, GetSecretKeyResponseModel>> getSecretKey();
  Future<Either<Failure, ApiResponse<bool>>> add2FA(
    TwoFactorAuthenticationRequestModel params,
  );
  Future<Either<Failure, ApiResponse<bool>>> remove2FA(
    TwoFactorAuthenticationRequestModel params,
  );
  Future<Either<Failure, ApiResponse<OtpVerificationStatus>>> verifyOtp(
    TwoFactorAuthenticationRequestModel params,
  );
  Future<Either<Failure, ApiResponse<ChangePasswordDataModel>>> changePassword(
    ChangePasswordRequestModel params,
  );

  Future<Either<Failure, ApiResponse<bool>>> forgetPassword(
    ForgetPasswordRequestModel params,
  );

  Future<Either<Failure, ApiResponse<bool>>> verifyOtpForForgetPassword(
    VerifyOtpRequestModel params,
  );

  Future<Either<Failure, ApiResponse<bool>>> resetPassword(
    ResetPasswordRequestModel params,
  );
}
