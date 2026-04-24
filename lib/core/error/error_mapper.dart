import 'package:dio/dio.dart';
import 'exceptions.dart';
import 'failures.dart';

class ErrorMapper {
  static Failure mapExceptionToFailure(dynamic exception) {
    if (exception is DioException) {
      if (exception.type == DioExceptionType.connectionTimeout ||
          exception.type == DioExceptionType.receiveTimeout ||
          exception.type == DioExceptionType.sendTimeout ||
          exception.type == DioExceptionType.connectionError) {
        return const NetworkFailure('No internet connection');
      }
      return ServerFailure('API Error: ${exception.message}');
    } else if (exception is ServerException) {
      return const ServerFailure('Server Exception Occurred');
    }
    return const ServerFailure('Unexpected Error');
  }
}
