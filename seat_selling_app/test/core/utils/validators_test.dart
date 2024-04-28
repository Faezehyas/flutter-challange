import 'package:seat_selling_app/core/utils/validators.dart';
import 'package:test/test.dart';

void main() {
  group('Validator Functions Test', () {
    test('usernameValidator returns error for empty username', () {
      const emptyUsername = '';
      final errorMessage = usernameValidator(emptyUsername);
      expect(errorMessage, 'Username cannot be empty');
    });

    test('usernameValidator returns null for valid username', () {
      const validUsername = 'test_user';
      final errorMessage = usernameValidator(validUsername);
      expect(errorMessage, null);
    });

    test('passwordValidator returns error for empty password', () {
      const emptyPassword = '';
      final errorMessage = passwordValidator(emptyPassword);
      expect(errorMessage, 'Password cannot be empty');
    });

    test('passwordValidator returns null for valid password', () {
      const validPassword = 'secret123';
      final errorMessage = passwordValidator(validPassword);
      expect(errorMessage, null);
    });
  });
}
