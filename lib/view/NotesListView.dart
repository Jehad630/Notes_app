import 'package:flutter/material.dart';
import 'package:new_notes_app/widget/NoteItem.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 16),
            child: NoteItem(),
          );
        },
      ),
    );
  }
}
