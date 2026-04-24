import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../auth/data/secure_storage_manager.dart';

@injectable
class AuthInterceptor extends Interceptor {
  final SecureStorageManager _secureStorageManager;

  AuthInterceptor(this._secureStorageManager);

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await _secureStorageManager.getToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer ${token.accessToken}';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      /* TODO: Implement token refresh logic in future phase */
    }
    handler.next(err);
  }
}
