import 'package:fpdart/fpdart.dart';

import '../errors/api_exceptions.dart';


abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {}
