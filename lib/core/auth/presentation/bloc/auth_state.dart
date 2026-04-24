import 'package:equatable/equatable.dart';
import '../../domain/entities/auth_token.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthAuthenticated extends AuthState {
  final AuthToken token;

  const AuthAuthenticated(this.token);

  @override
  List<Object?> get props => [token];
}

class AuthUnauthenticated extends AuthState {}
