import 'package:flutter/material.dart';
import 'package:new_notes_app/view/Notes_view.dart';
import 'package:new_notes_app/view/SigninView.dart';

void main() {
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      // home: const NotesView(),
      initialRoute: "Signinview",
      routes: {
        "NotesView": (context) => const NotesView(),
        "Signinview": (context) => const Signinview(),
      },
    );
  }
}
