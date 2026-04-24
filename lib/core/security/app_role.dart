enum AppRole {
  admin,
  agent,
  user,
  guest,
}

extension AppRoleX on AppRole {
  static AppRole fromString(String value) {
    switch (value.toLowerCase()) {
      case 'admin':
        return AppRole.admin;
      case 'agent':
        return AppRole.agent;
      case 'user':
        return AppRole.user;
      default:
        return AppRole.guest;
    }
  }
}
