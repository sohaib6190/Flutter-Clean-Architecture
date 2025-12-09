
import 'package:flutter_clean_architecture/features/todo/todo_listing/domain/repositories/todo_repository.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../../../app/errors/api_exceptions.dart';
import '../../../../../../app/use_cases/use_case.dart';
import '../../../data/models/request/todo_listing_params.dart';
import '../../../data/models/response/todo_listing_model.dart';

class TodoListingUsecase
    extends UseCase<TodoListingModel, TodoListingParams> {
  final TodoRepository repository;

  TodoListingUsecase(this.repository);
  @override
  Future<Either<Failure, TodoListingModel>> call(
    TodoListingParams params,
  ) async {
    return repository.todoListing(params);
  }


}



