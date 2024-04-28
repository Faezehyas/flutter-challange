import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:seat_selling_app/core/di/get_it.dart';
import 'package:seat_selling_app/core/utils/constants.dart';
import 'package:seat_selling_app/domain/entity/user_entity.dart';
import 'package:seat_selling_app/domain/usecase/auth_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is LoginEvent) {
        emit(AuthLoading());
        try {
          final result =
              await getIt<AuthUseCase>().login(event.username, event.password);
          if (result != null) {
            Constants.isLoggedIn = true;
            emit(AuthLoaded(userModel: result));
          } else {
            emit(const AuthError(message: 'Server Error'));
          }
        } catch (e) {
          emit(AuthError(message: e.toString()));
        }
      }
    });
  }
}
