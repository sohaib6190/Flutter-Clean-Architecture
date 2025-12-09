

import 'package:flutter_clean_architecture/features/todo/todo_listing/data/models/request/todo_listing_params.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../../app/errors/api_exceptions.dart';
import '../../domain/repositories/todo_repository.dart';
import '../datasources/remote/todo_remote_datasource.dart';
import '../models/response/todo_listing_model.dart';


class TodoRepositoryImplementation implements TodoRepository {

  final TodoRemoteDatasource remoteDatasource;

  TodoRepositoryImplementation({required this.remoteDatasource});

  @override
  Future<Either<Failure, TodoListingModel>>
  todoListing(TodoListingParams params) async {
    try {
      final response = await remoteDatasource
          .fetchTodoListing(params);
      return right(response);
    } on Failure catch (e) {
      return left(Failure(message: e.message));
    }
  }

}
