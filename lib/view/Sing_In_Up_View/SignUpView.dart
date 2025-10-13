import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_notes_app/services/ShowSnackBar.dart';
import 'package:new_notes_app/view/Notes_View/Notes_view.dart';
import 'package:new_notes_app/view/Sing_In_Up_View/SignInView.dart';
import 'package:new_notes_app/widget/CustomTextFields&Butttong/ButtonWidget.dart';
import 'package:new_notes_app/widget/CustomTextFields&Butttong/CustomTextfieldSign.dart';

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
          CustomButtonWidget(
            color: Color(0xFF4D5A68),
            text: "Sign Up",
            onTap: () async {
              try {
                await signUpUser();
                ShowSnackBar(context, "Account created successfully! ");
                Navigator.pushNamed(context, NotesView().id, arguments: email);
              } on FirebaseAuthException catch (e) {
                if (e.code == 'weak-password') {
                  ShowSnackBar(context, "The password provided is too weak.");
                } else if (e.code == 'email-already-in-use') {
                  ShowSnackBar(
                    context,
                    "The account already exists for that email.",
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

  Future<void> signUpUser() async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
