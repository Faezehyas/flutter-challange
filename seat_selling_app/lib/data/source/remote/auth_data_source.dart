import 'dart:developer';
import 'package:seat_selling_app/core/di/get_it.dart';
import 'package:seat_selling_app/core/utils/request.dart';
import 'package:seat_selling_app/data/models/user_model.dart';

abstract class AuthDataSource {
  Future<UserModel?> login(String username, String password);
}

class AuthDataSourceImpl extends AuthDataSource {
  @override
  Future<UserModel?> login(String username, String password) async {
    try {
      final Request request = getIt<Request>();
      final response = await request.post(
        '/login',
        // data: UserModel.toJson(username,password),
        //* request body should be passed in a json format after the backend services been implemented
      );
      if (response.statusCode == 200) {
        // check validations needed and return response
        return response.data as UserModel;
      }
      return null;
    } catch (error) {
      log('AuthDataSourceImpl error:$error');
      return null;
    }
  }
}
