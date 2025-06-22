class ResetPasswordEntity {
  final String email;
  final String token;
  final String newPassword;
  final String confirmPassword;

  ResetPasswordEntity(
      {required this.email,
      required this.token,
      required this.newPassword,
      required this.confirmPassword});
}
