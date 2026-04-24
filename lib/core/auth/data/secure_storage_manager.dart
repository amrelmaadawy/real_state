import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import '../domain/entities/auth_token.dart';

@singleton
class SecureStorageManager {
  final FlutterSecureStorage _storage;

  static const String _accessTokenKey = 'ACCESS_TOKEN';
  static const String _refreshTokenKey = 'REFRESH_TOKEN';

  SecureStorageManager(this._storage);

  Future<void> saveToken(AuthToken token) async {
    await _storage.write(key: _accessTokenKey, value: token.accessToken);
    await _storage.write(key: _refreshTokenKey, value: token.refreshToken);
  }

  Future<AuthToken?> getToken() async {
    final accessToken = await _storage.read(key: _accessTokenKey);
    final refreshToken = await _storage.read(key: _refreshTokenKey);

    if (accessToken == null || refreshToken == null) {
      return null;
    }

    return AuthToken(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }

  Future<void> deleteToken() async {
    await _storage.delete(key: _accessTokenKey);
    await _storage.delete(key: _refreshTokenKey);
  }
}
