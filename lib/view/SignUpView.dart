import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_notes_app/view/Notes_view.dart';
import 'package:new_notes_app/view/SignInView.dart';
import 'package:new_notes_app/widget/ButtonWidget.dart';
import 'package:new_notes_app/widget/TextField.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});
  final String id = "SignUpView";
  @override
  State<SignUpView> createState() => _SigninviewState();
}

class _SigninviewState extends State<SignUpView> {
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
            "Notes App   ",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 70),
          Text(
            "  Sign Up",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          CustomTextfield(
            hint: "email",
            obscureText: false,
            onChanged: (data) {
              email = data;
            },
          ),
          CustomTextfield(
            hint: "Password",
            obscureText: true,
            onChanged: (data) {
              password = data;
            },
          ),
          SizedBox(height: 20),
          ButtonWidget(
            color: Color(0xFF4D5A68),
            text: "Sign Up",
            onTap: () async {
              try {
                await SignUpUser();
                Navigator.pushNamed(context, NotesView().id, arguments: email);
              } on FirebaseAuthException catch (e) {
                if (e.code == 'weak-password') {
                  print('The password provided is too weak.');
                } else if (e.code == 'email-already-in-use') {
                  print('The account already exists for that email.');
                }
              } catch (e) {
                print(e);
              }
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("have an account?"),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, SignInView().id);
                },
                child: Text(
                  "Sign in",
                  style: TextStyle(color: Color(0xFFFFCA42), fontSize: 16),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> SignUpUser() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
