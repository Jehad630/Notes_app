import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:new_notes_app/cubits/cubit/notes_cubit.dart';
import 'package:new_notes_app/services/ShowSnackBar.dart';
import 'package:new_notes_app/widget/AddNoteWidgets/AddNoteForm.dart';

class AddNoteWidet extends StatelessWidget {
  const AddNoteWidet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNotesCubit(),
      child: BlocConsumer<AddNotesCubit, AddNotesState>(
        listener: (context, state) {
          if (state is NotesFailure) {
            ShowSnackBar(context, "failed to add note ${state.errMessage}");
          } else if (state is NotesSuccess) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is NotesLoading ? true : false,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: SingleChildScrollView(child: const AddNoteForm()),
            ),
          );
        },
      ),
    );
  }
}
