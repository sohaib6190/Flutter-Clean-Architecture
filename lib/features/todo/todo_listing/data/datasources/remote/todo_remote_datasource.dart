


import '../../models/request/todo_listing_params.dart';
import '../../models/response/todo_listing_model.dart';

abstract class TodoRemoteDatasource {
  TodoRemoteDatasource();

  Future<TodoListingModel> fetchTodoListing(TodoListingParams params);

}
