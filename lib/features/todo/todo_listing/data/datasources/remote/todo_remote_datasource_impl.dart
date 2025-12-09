

import 'dart:developer';

import '../../../../../../app/constants/app_errors.dart';
import '../../../../../../app/errors/api_exceptions.dart';
import '../../../../../../app/network/client/dio_client.dart';
import '../../../../../../app/network/config/api_endpoints.dart';
import '../../../../../../app/network/config/error_handler.dart';
import '../../models/request/todo_listing_params.dart';
import '../../models/response/todo_listing_model.dart';
import 'todo_remote_datasource.dart';


class TodoRemoteDatasourceImplementation
    implements TodoRemoteDatasource {
  final DioClient client;
  TodoRemoteDatasourceImplementation({required this.client});


  
  @override
  Future<TodoListingModel> fetchTodoListing(TodoListingParams params) async {
    log("Params is $params");
    return ApiErrorHandler.executeGuarded(() async {
      final response = await client.get(
        endpoint: ApiEndpoints.listAllItrsInIT.value,
        queryParams: {
      
        },
      );
      if (response.statusCode == 200) {
        return TodoListingModel.fromJson(response.data);
      } else {
        throw ServerException(
          statusCode: response.statusCode,
          message: response.data['message'] ?? AppErrors.somethingWentWrong,
        );
      }
    });
  }






}
