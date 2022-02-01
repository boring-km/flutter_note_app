import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_note_app/domain/model/note.dart';
import 'package:flutter_note_app/domain/repository/note_repository.dart';
import 'package:flutter_note_app/presentation/add_edit_note/add_edit_note_event.dart';
import 'package:flutter_note_app/presentation/add_edit_note/add_edit_note_ui_event.dart';
import 'package:flutter_note_app/ui/colors.dart';

class AddEditNoteViewModel with ChangeNotifier {
  final NoteRepository _repository;

  AddEditNoteViewModel(this._repository);

  int _color = roseBud.value;

  int get color => _color;

  final _eventController = StreamController<AddEditNoteUiEvent>.broadcast();

  Stream<AddEditNoteUiEvent> get eventStream => _eventController.stream;

  void onEvent(AddEditNoteEvent event) {
    event.when(
      changeColor: _changeColor,
      saveNote: _saveNote,
    );
  }

  Future<void> _changeColor(int color) async {
    _color = color;
    notifyListeners();
  }

  Future<void> _saveNote(int? id, String title, String content) async {
    if (title.isEmpty || content.isEmpty) {
      _eventController.add(const AddEditNoteUiEvent.showSnackBar('제목이나 내용이 비어 있습니다.'));
      return;
    }

    if (id == null) {
      await _repository.insertNote(
        Note(
          title: title,
          content: content,
          color: color,
          timestamp: DateTime.now().millisecondsSinceEpoch,
        ),
      );
    } else {
      await _repository.updateNote(
        Note(
          id: id,
          title: title,
          content: content,
          color: color,
          timestamp: DateTime.now().millisecondsSinceEpoch,
        ),
      );
    }
    _eventController.add(const AddEditNoteUiEvent.saveNote());
  }
}
