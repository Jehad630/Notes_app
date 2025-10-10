import 'package:flutter/material.dart';
import 'package:new_notes_app/view/Notes_view.dart';
import 'package:new_notes_app/widget/ButtonWidget.dart';
import 'package:new_notes_app/widget/TextField.dart';

class Signinview extends StatefulWidget {
  const Signinview({super.key});
  final String id = "Signinview";
  @override
  State<Signinview> createState() => _SigninviewState();
}

class _SigninviewState extends State<Signinview> {
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
          Text(
            "  Sign in",
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
          ButtonWidget(
            color: Color(0xFF4D5A68),
            text: "Sign in",
            onTap: () {
              Navigator.pushNamed(context, NotesView().id);
            },
          ),
        ],
      ),
    );
  }
}
