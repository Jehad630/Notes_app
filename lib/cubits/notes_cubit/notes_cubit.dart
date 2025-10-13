import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:new_notes_app/model/note_model.dart';
import 'package:new_notes_app/services/constants.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  fetchAllNotes()async{
    

    try {
      var notesbox = Hive.box(kNotesBox);
      List<NoteModel> notes = notesbox.values.toList().cast<NoteModel>();
      emit(NotesSuccess(notes));
    } catch (e) {
     emit(NotesFailure(e.toString())) ;
    }
  }
}
