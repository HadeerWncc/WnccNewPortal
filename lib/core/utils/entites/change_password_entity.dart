class ChangePasswordEntity {
  final String? id;
  final String currentPassword;
  final String newPassword;
  final String confirmPassword;

  ChangePasswordEntity({
    required this.id,
    required this.currentPassword,
    required this.newPassword,
    required this.confirmPassword,
  });
}
