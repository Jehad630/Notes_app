import 'package:flutter/material.dart';

import 'package:new_notes_app/view/Notes_View/NotesViewBody.dart';
import 'package:new_notes_app/view/AddNoteViews/AddNoteWidet.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});
  final String id = "NotesView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffB12E65),
        foregroundColor: Colors.black,
        onPressed: () {
          showModalBottomSheet(
            // lets it take the full height of the screen and under it there is the keyboard
            // so user can see what he is typing
            // and we used in the AddNoteWidet the MediaQuery to give padding to the bottom of the form
            // equal to the height of the keyboard
            isScrollControlled: true,
    
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
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
