import 'package:flutter/material.dart';
import 'app_role.dart';
import 'security_manager.dart';

class RequireRole extends StatelessWidget {
  final AppRole requiredRole;
  final AppRole currentRole;
  final Widget child;
  final Widget fallback;

  const RequireRole({
    super.key,
    required this.requiredRole,
    required this.currentRole,
    required this.child,
    this.fallback = const SizedBox.shrink(),
  });

  @override
  Widget build(BuildContext context) {
    if (SecurityManager.hasRole(currentRole, requiredRole)) {
      return child;
    }
    return fallback;
  }
}
