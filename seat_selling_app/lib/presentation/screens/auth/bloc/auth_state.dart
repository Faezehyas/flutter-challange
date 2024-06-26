part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthLoaded extends AuthState {
  final UserEntity userModel;

  const AuthLoaded({required this.userModel});
}

class AuthError extends AuthState {
  final String message;

  const AuthError({required this.message});
}
