import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:new_notes_app/services/firebase_options.dart';
import 'package:new_notes_app/view/Notes_view.dart';
import 'package:new_notes_app/view/SignUpView.dart';
import 'package:new_notes_app/view/SignInView.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),

      initialRoute: NotesView().id,
      routes: {
        NotesView().id: (context) => const NotesView(),
        SignInView().id: (context) => const SignInView(),
        SignUpView().id: (context) => const SignUpView(),
      },
    );
  }
}
