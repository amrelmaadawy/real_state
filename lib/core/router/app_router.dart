import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'app_routes.dart';
import 'go_router_refresh_stream.dart';
import '../auth/presentation/bloc/auth_bloc.dart';
import '../auth/presentation/bloc/auth_state.dart';

@singleton
class AppRouter {
  late final GoRouter router;
  final AuthBloc _authBloc;

  AppRouter(this._authBloc) {
    router = GoRouter(
      initialLocation: AppRoutes.home,
      refreshListenable: GoRouterRefreshStream(_authBloc.stream),
      redirect: (context, state) {
        final authState = _authBloc.state;
        final bool isAuthenticated = authState is AuthAuthenticated;
        final bool isLoginRoute = state.matchedLocation == AppRoutes.login;

        if (!isAuthenticated && !isLoginRoute) {
          return AppRoutes.login;
        }
        if (isAuthenticated && isLoginRoute) {
          return AppRoutes.home;
        }
        return null;
      },
      routes: [
        GoRoute(
          path: AppRoutes.login,
          builder: (context, state) => const Scaffold(
            body: Center(child: Text('Login Screen')),
          ),
        ),
        GoRoute(
          path: AppRoutes.home,
          builder: (context, state) => const Scaffold(
            body: Center(child: Text('Home Screen')),
          ),
        ),
      ],
    );
  }
}
