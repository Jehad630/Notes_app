import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_notes_app/services/ShowSnackBar.dart';
import 'package:new_notes_app/view/Notes_view.dart';
import 'package:new_notes_app/view/SignUpView.dart';
import 'package:new_notes_app/widget/ButtonWidget.dart';
import 'package:new_notes_app/widget/CustomTextfield.dart';
import 'package:new_notes_app/widget/CustomTextfieldSign.dart';

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
          SizedBox(height: 50),
          Image.asset("assets/notes.png", height: 150, width: 200),
          SizedBox(height: 20),
          Text(
            "Notes App",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 70),
          Text(
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
          SizedBox(height: 20),
          ButtonWidget(
            color: Color(0xFF4D5A68),
            text: "Sign in",
            onTap: () async {
              try {
                signIn();
                ShowSnackBar(context, "Login Successful");
                Navigator.pushNamed(context, NotesView().id, arguments: email);
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
              Text("Don't have an account?"),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, SignUpView().id);
                },
                child: Text(
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
