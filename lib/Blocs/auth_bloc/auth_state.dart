part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class LoginLoading extends AuthState {}

final class LoginSuccess extends AuthState {}

final class LoginFailure extends AuthState {
  String message;
  LoginFailure({required this.message});
}

class RegisterSuccess extends AuthState {}

class RegisterLoading extends AuthState {}

class RegisterFaliure extends AuthState {
  String message;
  RegisterFaliure({required this.message});
}
