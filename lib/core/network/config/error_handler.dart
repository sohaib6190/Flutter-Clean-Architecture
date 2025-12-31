import 'dart:async';

import 'package:dio/dio.dart';

import '../../errors/api_exceptions.dart';
import '../../errors/dio_exception_mapper.dart';


class ApiErrorHandler {
  static Future<T> executeGuarded<T>(Future<T> Function() call) async {
    try {
      return await call();
    } on DioException catch (e) {
      throw DioExceptionMapper.mapDioExceptionToFailure(e);
    } on FormatException catch (e) {
      throw ParsingException(message: 'Invalid JSON: ${e.message}');
    } catch (e) {
      throw UnknownException(message: 'Unexpected error: $e');
    }
  }
}
