import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> signIn({required String email, required String password}) async {
    emit(LoginLoading());
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailure(message: "No user found for that email."));
      } else if (e.code == 'wrong-password') {
        emit(LoginFailure(message: "Wrong password provided for that user."));
      }
    } on Exception catch (e) {
      emit(LoginFailure(message: e.toString()));
    }
  }

  Future<void> signUpUser({
    required String email,
    required String password,
  }) async {
    emit(RegisterLoading());
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterFaliure(message: "weak password"));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterFaliure(message: "email already in use "));
      }
    } on Exception catch (e) {
      emit(RegisterFaliure(message: e.toString()));
    }
  }
}
