import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:new_notes_app/model/note_model.dart';
import 'package:new_notes_app/services/ShowSnackBar.dart';
import 'package:new_notes_app/services/constants.dart';
import 'package:new_notes_app/widget/Colors/Colors_ListView.dart';
import 'package:new_notes_app/widget/Colors/EditNoteColorsList.dart';
import 'package:new_notes_app/widget/CustomTextFields&Butttong/CustomTextfield.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Note"),
        actions: [
          IconButton(
            onPressed: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.subtitle = content ?? widget.note.subtitle;
              widget.note.save();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
              ShowSnackBar(context, 'noete edited successfully');
            },
            icon: const Icon(Icons.check, size: 32),
          ),
        ],
      ),
      body: Column(
        children: [
          CustomTextfield(
            hint: widget.note.title,
            onChanged: (value) {
              title = value;
            },
          ),
          CustomTextfield(
            hint: widget.note.subtitle,
            maxLines: 5,
            onChanged: (value) {
              content = value;
            },
          ),
          EditNoteColorsList(note: widget.note),
        ],
      ),
    );
  }
}
