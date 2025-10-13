import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_notes_app/services/ShowSnackBar.dart';
import 'package:new_notes_app/view/Notes_View/NotesListView.dart';
import 'package:new_notes_app/view/SingIn__Up_View/SignInView.dart';


class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});
  final String id = "NotesViewBody";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes App"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            hoverColor: Color(0xffCAD4E4),
          ),
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
      body: Column(
        children: [
          Expanded(child: NotesListView()),
          
        ],
      ),
    );
  }
}
