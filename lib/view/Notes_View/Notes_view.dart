import 'package:flutter/material.dart';
import 'package:new_notes_app/view/Notes_View/NotesViewBody.dart';
import 'package:new_notes_app/widget/AddNoteWidgets/AddNoteWidet.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});
  final String id = "NotesView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffB12E65),
        foregroundColor: Colors.black,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return AddNoteWidet();
            },
          );
        },
        child: Icon(Icons.add),
      ),
      body: const NotesViewBody(),
    );
  }
}
