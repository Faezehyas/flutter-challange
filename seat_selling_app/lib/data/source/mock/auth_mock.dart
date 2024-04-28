import 'package:seat_selling_app/data/models/user_model.dart';
import 'package:seat_selling_app/data/source/remote/auth_data_source.dart';

class AuthDataSourceMockImpl extends AuthDataSource {
  @override
  Future<UserModel?> login(String username, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    return UserModel(id: 1, username: username, password: password);
  }
}
