import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:new_notes_app/model/note_model.dart';
import 'package:new_notes_app/services/constants.dart';

part 'add_notes_state.dart';

class AddNotesCubit extends Cubit<AddNotesState> {
  AddNotesCubit() : super(AddNotesInitial());

  Color? selectedColor = const Color(0xffD36836);
  addNote(NoteModel note) async {
    note.color = selectedColor!.value;
    emit(AddNotesLoading());

    try {
      var notesbox = Hive.box<NoteModel>(kNotesBox);

      await notesbox.add(note);
      emit(AddNotesSuccess());
    } catch (e) {
      emit(AddNotesFailure(e.toString()));
    }
  }
}
