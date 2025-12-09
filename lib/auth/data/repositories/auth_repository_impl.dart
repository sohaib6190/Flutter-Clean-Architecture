import 'package:flutter_clean_architecture/auth/domain/repositories/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

import '../../../app/errors/api_exceptions.dart';
import '../../domain/entities/user_entity.dart';
import '../data_sources/remote/auth_remote_datasource.dart';
import '../models/request/change_password_request_model.dart';
import '../models/request/forget_password_request_model.dart';
import '../models/request/login_request_model.dart';
import '../models/request/reset_password_request_model.dart';
import '../models/request/signup_request_model.dart';
import '../models/request/two_fa_request_model.dart';
import '../models/request/verify_otp_request_model.dart';
import '../models/response/api_response.dart';
import '../models/response/change_password_response_model.dart';
import '../models/response/get_secret_key_response_model.dart';
import '../models/response/otp_verification_status.dart';
import '../models/response/user_model.dart';

class AuthRepositoryImplementation implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImplementation({required this.remoteDataSource});

  @override
  Future<Either<Failure, UserEntity>> login({
    required LoginRequestModel params,
  }) async {
    try {
      final UserModel user = await remoteDataSource.login(params: params);
      return right(user);
    } on Failure catch (e) {
      return left(Failure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> logout() async {
    try {
      bool isSignOut = await remoteDataSource.signOut();
      return right(isSignOut);
    } on ServerException catch (e) {
      return left(Failure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signUp({
    required SignupRequestModel params,
  }) async {
    try {
      final UserModel user = await remoteDataSource.signUp(params: params);
      return right(user);
    } on Failure catch (e) {
      return left(Failure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, GetSecretKeyResponseModel>> getSecretKey() async {
    try {
      final GetSecretKeyResponseModel secretKey =
          await remoteDataSource.getSecretKey();
      return right(secretKey);
    } on Failure catch (e) {
      return left(Failure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, ApiResponse<bool>>> add2FA(
    TwoFactorAuthenticationRequestModel params,
  ) async {
    try {
      final ApiResponse<bool> isAdded = await remoteDataSource.add2FA(params);
      return right(isAdded);
    } on Failure catch (e) {
      return left(Failure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, ApiResponse<bool>>> remove2FA(
    TwoFactorAuthenticationRequestModel params,
  ) async {
    try {
      final ApiResponse<bool> isRemoved = await remoteDataSource.remove2FA(
        params,
      );
      return right(isRemoved);
    } on Failure catch (e) {
      return left(Failure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, ApiResponse<OtpVerificationStatus>>> verifyOtp(
    TwoFactorAuthenticationRequestModel params,
  ) async {
    try {
      final ApiResponse<OtpVerificationStatus> isVerified =
          await remoteDataSource.verifyOtp(params);
      return right(isVerified);
    } on Failure catch (e) {
      return left(Failure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, ApiResponse<ChangePasswordDataModel>>> changePassword(
    ChangePasswordRequestModel params,
  ) async {
    try {
      final ApiResponse<ChangePasswordDataModel> response =
          await remoteDataSource.changePassword(params);
      return right(response);
    } on Failure catch (e) {
      return left(Failure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, ApiResponse<bool>>> forgetPassword(
    ForgetPasswordRequestModel params,
  ) async {
    try {
      final response = await remoteDataSource.forgetPassword(params);
      return right(response);
    } on Failure catch (e) {
      return left(Failure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, ApiResponse<bool>>> verifyOtpForForgetPassword(
    VerifyOtpRequestModel params,
  ) async {
    try {
      final response = await remoteDataSource.verifyOtpForForgetPassword(
        params,
      );
      return right(response);
    } on Failure catch (e) {
      return left(Failure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, ApiResponse<bool>>> resetPassword(
    ResetPasswordRequestModel params,
  ) async {
    try {
      final response = await remoteDataSource.resetPassword(params);
      return right(response);
    } on Failure catch (e) {
      return left(Failure(message: e.message));
    }
  }
}
