import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:new_notes_app/cubits/cubit/Auth_cubit/auth_cubit.dart';
import 'package:new_notes_app/services/ShowSnackBar.dart';
import 'package:new_notes_app/view/Notes_View/Notes_view.dart';
import 'package:new_notes_app/view/Sign_In_Up_View/SignUpView.dart';
import 'package:new_notes_app/widget/CustomTextFields&Butttong/ButtonWidget.dart';
import 'package:new_notes_app/widget/CustomTextFields&Butttong/CustomTextfieldSign.dart';

class SignInView extends StatelessWidget {
  SignInView({super.key});

  String? email, password;
  bool isLoading = false;
  final String id = "SignInView";
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginSuccess) {
          Navigator.pushNamed(context, const NotesView().id, arguments: email);
           isLoading = false;
        } else if (state is LoginFailure) {
          ShowSnackBar(context, state.message);
          isLoading = false;
        }
      },
      builder: (context, state) => ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          body: Form(
            key: formKey,
            child: ListView(
              children: [
                const SizedBox(height: 50),
                Image.asset("assets/notes.png", height: 150, width: 200),
                const SizedBox(height: 20),
                const Text(
                  "Notes App",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 70),
                const Text(
                  "  Sign in",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                CustomTextfieldSign(
                  hint: "email",
                  obscureText: false,
                  onChanged: (data) {
                    email = data;
                  },
                ),
                CustomTextfieldSign(
                  hint: "Password",
                  obscureText: true,
                  onChanged: (data) {
                    password = data;
                  },
                ),
                const SizedBox(height: 20),
                CustomButtonWidget(
                  color: const Color(0xFF4D5A68),
                  text: "Sign in",
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      BlocProvider.of<AuthCubit>(
                        context,
                      ).signIn(email: email!, password: password!);
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context,  SignUpView().id);
                      },
                      child: const Text(
                        "Sign up",
                        style: TextStyle(
                          color: Color(0xFFFFCA42),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  
}
