import 'package:equatable/equatable.dart';

class AuthToken extends Equatable {
  final String accessToken;
  final String refreshToken;
  final String role;

  const AuthToken({
    required this.accessToken,
    required this.refreshToken,
    this.role = 'user',
  });

  factory AuthToken.fromJson(Map<String, dynamic> json) {
    return AuthToken(
      accessToken: json['access_token'] ?? json['accessToken'] ?? '',
      refreshToken: json['refresh_token'] ?? json['refreshToken'] ?? '',
      role: json['role'] ?? 'user',
    );
  }

  @override
  List<Object?> get props => [accessToken, refreshToken, role];
}
