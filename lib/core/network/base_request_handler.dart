import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import '../error/failures.dart';
import '../error/error_mapper.dart';

class BaseRequestHandler {
  static Future<Either<Failure, T>> execute<T>({
    required Future<Response> Function() request,
    required T Function(dynamic data) parser,
  }) async {
    try {
      final response = await request();
      return Right(parser(response.data));
    } catch (e) {
      return Left(ErrorMapper.mapExceptionToFailure(e));
    }
  }
}
