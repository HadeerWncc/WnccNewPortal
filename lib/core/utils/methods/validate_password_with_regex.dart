String? validatePasswordWithRegex(String value) {
  final hasUpperCase = RegExp(r'[A-Z]');
  final hasLowerCase = RegExp(r'[a-z]');
  final hasDigit = RegExp(r'[0-9]');
  final hasSpecialChar = RegExp(r'[#?!@$%^&*-]');
  const minLength = 8;

  if (value.length < minLength) {
    return 'Must be at least 8 characters';
  }
  if (!hasUpperCase.hasMatch(value)) {
    return 'Must contain at least one uppercase letter';
  }
  if (!hasLowerCase.hasMatch(value)) {
    return 'Must contain at least one lowercase letter';
  }
  if (!hasDigit.hasMatch(value)) {
    return 'Must contain at least one digit';
  }
  if (!hasSpecialChar.hasMatch(value)) {
    return 'Must contain at least one special character';
  }
  return null;
}
