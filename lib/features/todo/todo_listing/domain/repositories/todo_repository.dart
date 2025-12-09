import 'package:flutter_clean_architecture/features/todo/todo_listing/data/models/request/todo_listing_params.dart';
import 'package:fpdart/fpdart.dart';


import '../../../../../app/errors/api_exceptions.dart';
import '../../data/models/response/todo_listing_model.dart';

abstract class TodoRepository {

   Future<Either<Failure, TodoListingModel>> todoListing(TodoListingParams params);

}
