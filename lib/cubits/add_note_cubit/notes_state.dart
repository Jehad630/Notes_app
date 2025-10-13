part of 'notes_cubit.dart';

@immutable
abstract class AddNotesState {}

final class NotesInitial extends AddNotesState {}

final class NotesLoading extends AddNotesState {}

final class NotesSuccess extends AddNotesState {}

final class NotesFailure extends AddNotesState {
  final String errMessage;
  NotesFailure(this.errMessage);
}
