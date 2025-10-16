import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_notes_app/services/ShowSnackBar.dart';
import 'package:new_notes_app/view/Notes_View/Notes_view.dart';
import 'package:new_notes_app/view/Sing_In_Up_View/SignUpView.dart';
import 'package:new_notes_app/widget/CustomTextFields&Butttong/ButtonWidget.dart';
import 'package:new_notes_app/widget/CustomTextFields&Butttong/CustomTextfieldSign.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});
  final String id = "SignInView";
  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  String? email, password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
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
              try {
                signIn();
                ShowSnackBar(context, "Login Successful");
                Navigator.pushNamed(context, const NotesView().id, arguments: email);
              } on FirebaseAuthException catch (e) {
                if (e.code == 'user-not-found') {
                  ShowSnackBar(context, "No user found for that email.");
                } else if (e.code == 'wrong-password') {
                  ShowSnackBar(
                    context,
                    "Wrong password provided for that user.",
                  );
                }
              } catch (e) {
                ShowSnackBar(context, e.toString());
                print(e);
              }
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don't have an account?"),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, const SignUpView().id);
                },
                child: const Text(
                  "Sign up",
                  style: TextStyle(color: Color(0xFFFFCA42), fontSize: 16),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> signIn() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
