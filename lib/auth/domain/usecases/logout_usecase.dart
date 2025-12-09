import 'package:fpdart/fpdart.dart';

import '../../../app/errors/api_exceptions.dart';
import '../../../app/use_cases/use_case.dart';
import '../repositories/auth_repository.dart';

class LogoutUseCase extends UseCase<bool, NoParams> {
  final AuthRepository _authRepository;

  LogoutUseCase(this._authRepository);

  @override
  Future<Either<Failure, bool>> call(params) async {
    return await _authRepository.logout();
  }
}
