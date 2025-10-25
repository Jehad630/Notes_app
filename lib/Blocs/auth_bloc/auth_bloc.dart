import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is LoginEvent) {
        emit(LoginLoading());
        try {
          await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: event.email,
            password: event.password,
          );
          emit(LoginSuccess());
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            emit(LoginFailure(message: "No user found for that email."));
          } else if (e.code == 'wrong-password') {
            emit(
              LoginFailure(message: "Wrong password provided for that user."),
            );
          }
        } on Exception catch (e) {
          emit(LoginFailure(message: e.toString()));
        }
      } else if (event is RegisterEvent) {
        emit(RegisterLoading());
        try {
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: event.email,
            password: event.password,
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
    });

    
  }
  @override
  void onTransition(Transition<AuthEvent, AuthState> transition) {
    // TODO: implement onTransition
    super.onTransition(transition);
  }
}
