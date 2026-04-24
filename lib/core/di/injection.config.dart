// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../auth/data/secure_storage_manager.dart' as _i196;
import '../auth/presentation/bloc/auth_bloc.dart' as _i687;
import '../network/api_client.dart' as _i557;
import '../network/interceptors/auth_interceptor.dart' as _i745;
import '../network/interceptors/error_interceptor.dart' as _i511;
import '../router/app_router.dart' as _i81;
import 'core_module.dart' as _i154;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final coreModule = _$CoreModule();
    gh.factory<_i511.ErrorInterceptor>(() => _i511.ErrorInterceptor());
    gh.singleton<_i361.Dio>(() => coreModule.dio);
    gh.singleton<_i558.FlutterSecureStorage>(() => coreModule.secureStorage);
    gh.singleton<_i196.SecureStorageManager>(
      () => _i196.SecureStorageManager(gh<_i558.FlutterSecureStorage>()),
    );
    gh.singleton<_i687.AuthBloc>(
      () => _i687.AuthBloc(gh<_i196.SecureStorageManager>()),
    );
    gh.factory<_i745.AuthInterceptor>(
      () => _i745.AuthInterceptor(gh<_i196.SecureStorageManager>()),
    );
    gh.singleton<_i557.ApiClient>(
      () => _i557.ApiClient(
        gh<_i361.Dio>(),
        gh<_i745.AuthInterceptor>(),
        gh<_i511.ErrorInterceptor>(),
      ),
    );
    gh.singleton<_i81.AppRouter>(() => _i81.AppRouter(gh<_i687.AuthBloc>()));
    return this;
  }
}

class _$CoreModule extends _i154.CoreModule {}
