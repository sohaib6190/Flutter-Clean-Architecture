import 'dart:async';

import 'package:fpdart/fpdart.dart';

import '../../../core/errors/api_exceptions.dart';
import '../../../core/use_cases/use_case.dart';
import '../../data/models/request/login_request_model.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class LoginUseCase extends UseCase<UserEntity, LoginRequestModel> {
  final AuthRepository authRepository;

  LoginUseCase(this.authRepository);

  @override
  Future<Either<Failure, UserEntity>> call(params) async {
    return await authRepository.login(params: params);
  }
}
