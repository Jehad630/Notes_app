import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_notes_app/services/ShowSnackBar.dart';
import 'package:new_notes_app/view/NotesViewBody.dart';
import 'package:new_notes_app/view/SigninView.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});
  final String id = "NotesView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: const NotesViewBody(),
    );
  }
}
