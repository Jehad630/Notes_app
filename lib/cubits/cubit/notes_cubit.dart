import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:new_notes_app/model/note_model.dart';
import 'package:new_notes_app/services/constants.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  addNote(NoteModel note) async {
    emit(NotesLoading());

    try {
      var notesbox = Hive.box(kNotesBox);
      emit(NotesSuccess());
      await notesbox.add(note);
    } catch (e) {
      NotesFailure(e.toString());
    }
  }
}
