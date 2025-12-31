import 'package:fpdart/fpdart.dart';

import '../../../core/errors/api_exceptions.dart';
import '../../../core/use_cases/use_case.dart';
import '../../data/models/request/signup_request_model.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class SignupUseCase extends UseCase<UserEntity, SignupRequestModel> {
  final AuthRepository authRepository;

  SignupUseCase(this.authRepository);

  @override
  Future<Either<Failure, UserEntity>> call(params) async {
    return await authRepository.signUp(params: params);
  }
}
