import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:new_notes_app/services/ShowSnackBar.dart';
import 'package:new_notes_app/view/Notes_View/NotesListView.dart';
import 'package:new_notes_app/view/Sing_In_Up_View/SignInView.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState() {
   BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes App"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            hoverColor: const Color(0xffCAD4E4),
          ),
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushNamed(context,  SignInView().id);
              ShowSnackBar(context, "Logged out successfully");
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: const Column(children: [Expanded(child: NotesListView())]),
    );
  }
}
