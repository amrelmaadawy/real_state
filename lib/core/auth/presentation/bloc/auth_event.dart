import 'package:equatable/equatable.dart';
import '../../domain/entities/auth_token.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class AuthCheckRequested extends AuthEvent {}

class LoggedIn extends AuthEvent {
  final AuthToken token;

  const LoggedIn(this.token);

  @override
  List<Object?> get props => [token];
}

class LoggedOut extends AuthEvent {}
