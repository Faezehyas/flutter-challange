import 'package:seat_selling_app/domain/entity/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity?> login(String username, String password);
}
