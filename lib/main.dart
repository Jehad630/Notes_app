import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:new_notes_app/model/note_model.dart';
import 'package:new_notes_app/services/constants.dart';
import 'package:new_notes_app/services/firebase_options.dart';
import 'package:new_notes_app/view/Notes_view.dart';
import 'package:new_notes_app/view/SignUpView.dart';
import 'package:new_notes_app/view/SignInView.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Firebase initialization
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  //Hive initialization
  await Hive.initFlutter();
  // making object box
  await Hive.openBox(kNotesBox);
  //the way to storage the data using the genrated adapter for the model 
  Hive.registerAdapter(NoteModelAdapter());

  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark,fontFamily: "Poppins"), 

      initialRoute: NotesView().id,
      routes: {
        NotesView().id: (context) => const NotesView(),
        SignInView().id: (context) => const SignInView(),
        SignUpView().id: (context) => const SignUpView(),
        
      },
    );
  }
}
