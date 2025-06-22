class ChangePasswordEntity {
  final String currentPassword;
  final String newPassword;
  final String confirmPassword;

  ChangePasswordEntity(
      {required this.currentPassword,
      required this.newPassword,
      required this.confirmPassword});
}
