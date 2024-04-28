String? usernameValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Username cannot be empty';
  }
  return null;
}

String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password cannot be empty';
  }
  return null;
}
