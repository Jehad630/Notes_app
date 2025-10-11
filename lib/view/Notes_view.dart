import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_notes_app/services/ShowSnackBar.dart';
import 'package:new_notes_app/view/SigninView.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});
  final String id = "NotesView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes App"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushNamed(context, SignInView().id);
              ShowSnackBar(context, "Logged out successfully");
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}
