import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import '../../data/secure_storage_manager.dart';

@singleton
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SecureStorageManager _secureStorageManager;

  AuthBloc(this._secureStorageManager) : super(AuthInitial()) {
    on<AuthCheckRequested>((event, emit) async {
      final token = await _secureStorageManager.getToken();
      if (token != null) {
        emit(AuthAuthenticated(token));
      } else {
        emit(AuthUnauthenticated());
      }
    });

    on<LoggedIn>((event, emit) async {
      await _secureStorageManager.saveToken(event.token);
      emit(AuthAuthenticated(event.token));
    });

    on<LoggedOut>((event, emit) async {
      await _secureStorageManager.deleteToken();
      emit(AuthUnauthenticated());
    });
  }
}
