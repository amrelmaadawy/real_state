import 'package:equatable/equatable.dart';

class AuthToken extends Equatable {
  final String accessToken;
  final String refreshToken;

  const AuthToken({
    required this.accessToken,
    required this.refreshToken,
  });

  factory AuthToken.fromJson(Map<String, dynamic> json) {
    return AuthToken(
      accessToken: json['access_token'] ?? json['accessToken'] ?? '',
      refreshToken: json['refresh_token'] ?? json['refreshToken'] ?? '',
    );
  }

  @override
  List<Object?> get props => [accessToken, refreshToken];
}
