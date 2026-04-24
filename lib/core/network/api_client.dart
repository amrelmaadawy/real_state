import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'interceptors/auth_interceptor.dart';
import 'interceptors/error_interceptor.dart';

@singleton
class ApiClient {
  final Dio _dio;

  ApiClient(
    this._dio,
    AuthInterceptor authInterceptor,
    ErrorInterceptor errorInterceptor,
  ) {
    _dio.interceptors.addAll([
      authInterceptor,
      errorInterceptor,
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
      ),
    ]);
  }

  Future<Response> get(String path, {Map<String, dynamic>? queryParameters, Options? options}) {
    return _dio.get(path, queryParameters: queryParameters, options: options);
  }

  Future<Response> post(String path, {dynamic data, Map<String, dynamic>? queryParameters, Options? options}) {
    return _dio.post(path, data: data, queryParameters: queryParameters, options: options);
  }

  Future<Response> put(String path, {dynamic data, Map<String, dynamic>? queryParameters, Options? options}) {
    return _dio.put(path, data: data, queryParameters: queryParameters, options: options);
  }

  Future<Response> delete(String path, {dynamic data, Map<String, dynamic>? queryParameters, Options? options}) {
    return _dio.delete(path, data: data, queryParameters: queryParameters, options: options);
  }
}
