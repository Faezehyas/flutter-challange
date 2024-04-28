import 'package:seat_selling_app/core/di/get_it.dart';
import 'package:seat_selling_app/domain/entity/user_entity.dart';
import 'package:seat_selling_app/domain/repository/auth_repository.dart';

class AuthUseCase {
  Future<UserEntity?> login(String username, String password) async {
    return getIt<AuthRepository>().login(username, password);
  }
}
