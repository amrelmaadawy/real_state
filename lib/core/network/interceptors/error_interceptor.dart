import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Log the error globally or perform any generic error transformation
    handler.next(err);
  }
}
