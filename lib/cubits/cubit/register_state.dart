part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterSuccess extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterFaliure extends RegisterState {
  String message;
  RegisterFaliure({required this.message});
}
