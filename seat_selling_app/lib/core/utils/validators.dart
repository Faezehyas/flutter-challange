/// Validates a username string.
///
/// This function checks if the provided `value` is null or empty.
/// If so, it returns an error message indicating that the username cannot be empty.
/// Otherwise, it returns null, signifying a valid username.
String? usernameValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Username cannot be empty';
  }
  return null;
}

/// Validates a password string.
///
/// This function checks if the provided `value` is null or empty.
/// If so, it returns an error message indicating that the password cannot be empty.
/// Otherwise, it returns null, signifying a valid password.
String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password cannot be empty';
  }
  return null;
}
