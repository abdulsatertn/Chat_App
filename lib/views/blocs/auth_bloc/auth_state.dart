part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class RegisterInitial extends AuthState {}

final class RegisterLoading extends AuthState {}

final class RegisterSuccess extends AuthState {}

final class RegisterFailure extends AuthState {
  String errorMessage;

  RegisterFailure({required this.errorMessage});
}

class LoginInitial extends AuthState {}

class LoginSuccess extends AuthState {}

class LoginLoading extends AuthState {}

class LoginFailure extends AuthState {
  String errorMessage;

  LoginFailure({required this.errorMessage});
}
