import 'package:dio/dio.dart';

import '../../constants/app_errors.dart';
import '../../services/connectivity_service.dart';


class ConnectivityInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    bool isInternetConnected = await ConnectivityService.instance.isConnected;
    if (!isInternetConnected) {
      handler.reject(
        DioException(
          requestOptions: options,
          error: AppErrors.noInternetConnection,
          type: DioExceptionType.unknown,
        ),
      );
    } else {
      handler.next(options);
    }
  }
}
