import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@module
abstract class CoreModule {
  @singleton
  Dio get dio => Dio(BaseOptions(
        baseUrl: 'https://api.example.com',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ));

  @singleton
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage();
}
