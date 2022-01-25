import 'package:flutter_note_app/domain/model/note.dart';
import 'package:flutter_note_app/domain/repository/note_repository.dart';

class GetNote {
  final NoteRepository _repository;

  GetNote(this._repository);

  Future<Note?> call(int id) async {
    return await _repository.getNoteById(id);
  }
}