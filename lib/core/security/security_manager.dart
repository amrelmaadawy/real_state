import 'app_role.dart';

class SecurityManager {
  SecurityManager._(); // Private constructor to prevent instantiation

  static bool hasRole(AppRole currentRole, AppRole requiredRole) {
    if (currentRole == AppRole.admin) {
      return true; // Admins have global access
    }
    return currentRole == requiredRole;
  }
}
