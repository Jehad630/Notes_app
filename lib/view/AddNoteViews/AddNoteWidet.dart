import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_notes_app/cubits/add_note_cubit/add_notes_cubit.dart';
import 'package:new_notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:new_notes_app/services/ShowSnackBar.dart';
import 'package:new_notes_app/view/AddNoteViews/AddNoteForm.dart';

class AddNoteWidet extends StatelessWidget {
  const AddNoteWidet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNotesCubit(),
      child: BlocConsumer<AddNotesCubit, AddNotesState>(
        listener: (context, state) {
          if (state is AddNotesFailure) {
            ShowSnackBar(context, "failed to add note ${state.errMessage}");
          }
          if (state is AddNotesSuccess) {
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            Navigator.pop(context);
            ShowSnackBar(context, "the note has been added successfully");
          }
        },
        builder: (context, state) {
          // absorb pointer to prevent multiple taps when loading
          return AbsorbPointer(
            // if it loading will be true and the user can't interact with the form
            // if it not loading will be false and the user can interact with the form
            absorbing: state is AddNotesLoading ? true : false,

            child: Padding(
              padding: EdgeInsets.only(
                left: 16.0,
                right: 16,
                top: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: SingleChildScrollView(child: const AddNoteForm()),
            ),
          );
        },
      ),
    );
  }
}
