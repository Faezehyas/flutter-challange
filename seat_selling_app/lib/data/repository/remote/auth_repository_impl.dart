import 'package:seat_selling_app/core/di/get_it.dart';
import 'package:seat_selling_app/data/source/remote/auth_data_source.dart';
import 'package:seat_selling_app/domain/entity/user_entity.dart';
import 'package:seat_selling_app/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<UserEntity?> login(String username, String password) {
    return getIt<AuthDataSource>().login(username, password);
  }
}
