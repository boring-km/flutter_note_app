import 'package:flutter_note_app/domain/model/note.dart';
import 'package:flutter_note_app/domain/repository/note_repository.dart';

class GetNotes {

  final NoteRepository _repository;

  GetNotes(this._repository);

  Future<List<Note>> call() async {
    List<Note> notes = await _repository.getNotes();
    return notes;
  }
}